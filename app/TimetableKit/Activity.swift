//
//  Activity.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-18.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation

public struct Activity {

  public let identifier: Any?
  public let name: String

  public init(name: String = "", identifier: Any? = nil) {
    self.name = name
    self.identifier = identifier
  }

  public func isValid() -> Bool {
    return name != ""
  }

}
