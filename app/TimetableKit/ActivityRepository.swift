//
//  ActivityRepository.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-18.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation

public protocol ActivityRepository {

  func getAllActivities() -> [Activity]
  func getActivities(predicate: NSPredicate?, sortBy: String?) -> [Activity]
  func saveActivity(activity: Activity) -> Activity
}
