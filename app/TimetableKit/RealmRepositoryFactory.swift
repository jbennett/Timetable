//
//  RealmRepositoryFactory.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-18.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation
import RealmSwift

public class RealmRepositoryFactory: RepositoryFactory {

  let realm: Realm

  public init(realm: Realm) {
    self.realm = realm
  }

  lazy public var activityRepository: ActivityRepository = {
    return RealmActivityRepository(realm: self.realm)
  }()

}
