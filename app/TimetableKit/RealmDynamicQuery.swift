//
//  RealmDynamicQuery.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-20.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation
import RealmSwift

public class RealmDynamicQuery<T: Object>: DynamicQuery<T> {

  let realm: Realm
  let rootResult: Results<T>
  var managedResult: Results<T>
  var notificationToken: NotificationToken?

  public init(realm: Realm) {
    self.realm = realm
    rootResult = realm.objects(T.self)
    managedResult = rootResult
    super.init()

    registerForNotifications()
  }

  func registerForNotifications() {
    notificationToken = realm.addNotificationBlock { [weak self] _, _ in
      self?.pushQueryResults()
    }
  }

  func pushQueryResults() {
    self.itemsUpdateCallback?(self.getItems())
  }

  override func updateQuery() {
    managedResult = rootResult

    if let filterPredicate = filterPredicate {
      managedResult = managedResult.filter(filterPredicate)
    }

    if let sortKey = sortKey {
      managedResult = managedResult.sorted(sortKey)
    }

    pushQueryResults()
  }

  public override func getItems() -> [T] {
    return managedResult.map { $0 }
  }

}
