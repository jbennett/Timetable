//
//  RealmActivity.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-18.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation
import RealmSwift

public class RealmActivity: Object {

  public dynamic var identifier = NSUUID().UUIDString
  public dynamic var name: String = ""

  public func updateFromActivity(activity: Activity) {
    name = activity.name
  }

  public func toActivity() -> Activity {
    return Activity(name: name, identifier: identifier)
  }

  public func isValid() -> Bool {
    return name != ""
  }

  override public static func primaryKey() -> String? {
    return "identifier"
  }

}
