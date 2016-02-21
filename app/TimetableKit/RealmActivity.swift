//
//  RealmActivity.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-18.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation
import RealmSwift

public class RealmActivity: Object, Activity {

  public dynamic var identifier = NSUUID().UUIDString
  public dynamic var name: String = ""

  public func isValid() -> Bool {
    return name != ""
  }

  override public static func primaryKey() -> String? {
    return "identifier"
  }

}
