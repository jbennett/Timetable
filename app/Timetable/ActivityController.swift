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
    let form = ActivityForm(activity: activity)
    editViewController.activity = activity
    editViewController.form = form
    editViewController.delegate = self
    editViewController.dataSource = FormDataSource(form: form)
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

  func deleteActivity(activity: Activity, forViewController viewController: ActivitiesViewController) {
    activityRepository.deleteActivity(activity)
  }

}

extension ActivityController: EditActivityViewControllerDelegate {

  func editActivityViewController(viewController: EditActivityViewController, didCancelEditingActivity activity: Activity) {
    activitiesViewController.dismissViewControllerAnimated(true, completion: nil)
  }

  func editActivityViewController(viewController: EditActivityViewController, didSaveActivity activity: Activity) {
    activityRepository.saveActivity(activity)
    activitiesViewController.dismissViewControllerAnimated(true, completion: nil)
  }
}
