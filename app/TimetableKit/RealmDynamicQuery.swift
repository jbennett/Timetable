//
//  RealmDynamicQuery.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-20.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation
import RealmSwift

public class RealmDynamicQuery<T: RealmSwift.Object>: DynamicQuery {
  public typealias Element = T

  public var sortKey: String? {
    didSet { self.updateQuery() }
  }
  public var filterPredicate: NSPredicate? {
    didSet { self.updateQuery() }
  }
  public var itemsUpdateCallback: ([T] -> Void)?

  let realm: Realm
  let rootResult: Results<T>
  var managedResult: Results<T>

  public init(realm: Realm) {
    self.realm = realm

    rootResult = realm.objects(T.self)
    managedResult = rootResult

    NSNotificationCenter.defaultCenter().addObserverForName(RealmSwift.Notification.DidChange.rawValue, object: nil, queue: nil) {
      print("realm updated")
      print($0)
      self.itemsUpdateCallback?(self.getItems())
    }
  }

  func updateQuery() {
    managedResult = rootResult

    if let filterPredicate = filterPredicate {
      managedResult = managedResult.filter(filterPredicate)
    }

    if let sortKey = sortKey {
      managedResult = managedResult.sorted(sortKey)
    }
  }

  public func getItems() -> [T] {
    return managedResult.map { $0 }
  }

}
