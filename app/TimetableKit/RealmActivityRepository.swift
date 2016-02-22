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

  public func saveActivity(activity: Activity) -> Activity {
    if activity.identifier == nil {
      return createActivity(activity)
    } else {
      return updateActivity(activity)
    }
  }

  private func createActivity(activity: Activity) -> Activity {
    guard activity.identifier == nil else {
      fatalError("cannot create an activity that exists")
    }

    do {
      let realmActivity = RealmActivity()
      realmActivity.updateFromActivity(activity)
      try realm.write { realm.add(realmActivity) }
      return realmActivity.toActivity()
    } catch {
      // TODO: handle error
      fatalError("could not create activity")
    }
  }

  private func updateActivity(activity: Activity) -> Activity {
    guard let identifier = activity.identifier as? String else {
      fatalError("cannot update object with missing id")
    }

    let predicate = NSPredicate(format: "identifier = %@", identifier)
    if let realmActivity = realm.objects(RealmActivity).filter(predicate).first {
      do {
        try realm.write {
          realmActivity.updateFromActivity(activity)
        }

        return realmActivity.toActivity()
      } catch {
        // TODO: handle error
        fatalError("could not update activity")
      }
    } else {
      fatalError("tried to save activity with invalid identifier")
    }
  }

  public func getAllActivities() -> [Activity] {
    let activities = realm.objects(RealmActivity)
    return activities.map { $0.toActivity() }
  }

  public func getActivities(predicate: NSPredicate?, sortBy: String?) -> [Activity] {
    var activities = realm.objects(RealmActivity)

    if let predicate = predicate {
      activities = activities.filter(predicate)
    }

    if let sortBy = sortBy {
      activities = activities.sorted(sortBy)
    }

    return activities.map { $0.toActivity() }
  }

}
