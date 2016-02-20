//
//  ApplicationController.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-19.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit
import RealmSwift
import TimetableKit

class ApplicationController {

  let realm: Realm
  let repositoryFactory: RepositoryFactory

  var activityController: ActivityController?

  init() {
    do {
      self.realm = try Realm()
      self.repositoryFactory = RealmRepositoryFactory(realm: realm)
    } catch {
      fatalError("Could not setup database")
    }
  }

  func configureTabBarControllers(tabController: UITabBarController) {
    let rootViewControllers = tabController.viewControllers?
      .map { $0 as? UINavigationController }
      .flatMap { $0?.topViewController } ?? []

    for viewController in rootViewControllers {
      if let viewController = viewController as? ActivitiesViewController {
        let activityRepository = repositoryFactory.activityRepository
        let dataSource = SimpleDataSource<Activity>(data: activityRepository.getAllActivities(), cellIdentifier: "Activity Cell")
        viewController.dataSource = dataSource

        activityController = ActivityController(activityRepository: activityRepository, activitiesViewController: viewController)
      }
    }
  }

}
