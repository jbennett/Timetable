//
//  RealmActivityRepositoryTests.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-18.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import XCTest
import TimetableKit
import RealmSwift

class RealmActivityRepositoryTests: XCTestCase {

  var realm: Realm!
  var repository: RealmActivityRepository!

  override func setUp() {
    super.setUp()

    // swiftlint:disable force_try
    let random = rand()
    realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "TestRealm-\(random)"))
    repository = RealmActivityRepository(realm: realm)
  }

  func testThatICanCreateIt() {
    let repository: ActivityRepository = self.repository
    XCTAssertNotNil(repository)
  }

  func testThatICanGetActivities() {
    print("me too")
    let repository: ActivityRepository = self.repository
    let activities = repository.getAllActivities()
    XCTAssertNotNil(activities)
    XCTAssertEqual(activities.count, 0)
  }

  func testCorrectActivitiesAreRetrieved() throws {
    print("running")
    let repository: ActivityRepository = self.repository
    let activity1 = RealmActivity()
    let activity2 = RealmActivity()
    try realm.write {
      realm.add(activity1)
      realm.add(activity2)
    }

    let activities = repository.getAllActivities()
    XCTAssertEqual(activities.count, 2)
    XCTAssertTrue(activities.contains({ ($0 as? RealmActivity) == activity1 }))
    XCTAssertTrue(activities.contains({ ($0 as? RealmActivity) == activity2 }))
  }

}
