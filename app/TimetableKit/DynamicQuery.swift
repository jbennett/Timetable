//
//  DynamicQuery.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-20.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation

// TODO: This should be changed to a protocol once swift 3.0 allows
// full generics
public class DynamicQuery<T> {

  public var sortKey: String? {
    didSet { updateQuery() }
  }

  public var filterPredicate: NSPredicate? {
    didSet { updateQuery() }
  }

  public var itemsUpdateCallback: ([T] -> Void)?

  public func getItems() -> [T] {
    fatalError("getItems() not implemented in subclass")
  }

  internal func updateQuery() {}

}
