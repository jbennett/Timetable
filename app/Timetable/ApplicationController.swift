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
  var activityQueryAdaptor: QueryDataSourceAdaptor<RealmActivity, Activity>?

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
        let query = RealmDynamicQuery<RealmActivity>(realm: realm)
        query.sortKey = "name"
        let dataSource = SimpleDataSource<Activity>(data: [], cellIdentifier: "Activity Cell")
        let adaptor = QueryDataSourceAdaptor<RealmActivity, Activity>(query: query, dataSource: dataSource)
        adaptor.conversionFunction = { return $0.toActivity() }
        viewController.dataSource = dataSource
        query.pushQueryResults()

        activityQueryAdaptor = adaptor
        activityController = ActivityController(activityRepository: activityRepository, activitiesViewController: viewController)
      }
    }
  }

}
