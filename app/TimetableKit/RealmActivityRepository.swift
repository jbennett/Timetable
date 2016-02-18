//
//  RealmActivityRepository.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-18.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation
import RealmSwift

public class RealmActivityRepository: ActivityRepository {

  let realm: Realm

  public init(realm: Realm) {
    self.realm = realm
  }

  public func getAllActivities() -> [Activity] {
    let activities = realm.objects(RealmActivity)
    return activities.map { $0 }
  }

}
