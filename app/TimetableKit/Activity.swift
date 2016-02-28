//
//  Activity.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-18.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation

public struct Activity {

  public let identifier: AnyObject?
  public let name: String
  public let activityPatterns: [ActivityPattern]

  public init(name: String = "", activityPatterns: [ActivityPattern] = [], identifier: AnyObject? = nil) {
    self.name = name
    self.activityPatterns = activityPatterns
    self.identifier = identifier
  }

  public func isValid() -> Bool {
    return name != ""
  }

}
