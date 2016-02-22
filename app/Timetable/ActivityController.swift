//
//  ActivityController.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-20.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit
import TimetableKit

class ActivityController {

  let activityRepository: ActivityRepository
  let activitiesViewController: ActivitiesViewController

  init(activityRepository: ActivityRepository, activitiesViewController: ActivitiesViewController) {
    self.activityRepository = activityRepository
    self.activitiesViewController = activitiesViewController
    activitiesViewController.delegate = self
  }

  func editActivity(activity: Activity?) {
    let activity = activity ?? Activity()
    let editViewController = EditActivityViewController.fromStoryboard()
    editViewController.activity = activity
    editViewController.delegate = self
    let navViewController = UINavigationController(rootViewController: editViewController)

    activitiesViewController.presentViewController(navViewController, animated: true, completion: nil)
  }

}

extension ActivityController: ActivitiesViewControllerDelegate {

  func addActivityForActivitiesViewController(activitiesViewController: ActivitiesViewController) {
    editActivity(nil)
  }

  func editActivity(activity: Activity, forViewController viewController: ActivitiesViewController) {
    editActivity(activity)
  }

}

extension ActivityController: EditActivityViewControllerDelegate {

  func editActivityViewController(viewController: EditActivityViewController, didCancelEditingActivity activity: Activity) {
    activitiesViewController.dismissViewControllerAnimated(true, completion: nil)
  }

  func editActivityViewController(viewController: EditActivityViewController, didSaveActivity activity: Activity) {
    activityRepository.saveActivity(activity)
    activitiesViewController.dismissViewControllerAnimated(true, completion: nil)

    let dataSource = SimpleDataSource<Activity>(data: activityRepository.getActivities(nil, sortBy: "name"), cellIdentifier: "Activity Cell")
    activitiesViewController.dataSource = dataSource
  }
}
