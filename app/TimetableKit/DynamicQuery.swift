//
//  DynamicQuery.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-20.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation

public protocol DynamicQuery {
  typealias Element

  var sortKey: String? { get set }
  var filterPredicate: NSPredicate? { get set }
  var itemsUpdateCallback: ([Element] -> Void)? { get set }

  func getItems() -> [Element]

}
