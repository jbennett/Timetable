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

  public func createActivity() -> Activity {
    return RealmActivity()
  }

  public func saveActivity(activity: Activity) {
    guard let activity = activity as? RealmActivity else {
      fatalError("Trying to save non-realm data into realm")
    }

    do {
      try realm.write {
        realm.add(activity)
      }
    } catch {
      fatalError("could not save data into realm")
    }
  }

  public func getAllActivities() -> [Activity] {
    let activities = realm.objects(RealmActivity)
    return activities.map { $0 }
  }

  public func getActivities(predicate: NSPredicate?, sortBy: String?) -> [Activity] {
    var activities = realm.objects(RealmActivity)

    if let predicate = predicate {
      activities = activities.filter(predicate)
    }

    if let sortBy = sortBy {
      activities = activities.sorted(sortBy)
    }

    return activities.map { $0 }
  }

}
