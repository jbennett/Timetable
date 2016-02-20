//
//  Activity.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-18.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation

public protocol Activity {

  var name: String { get set }

  func isValid() -> Bool

}
