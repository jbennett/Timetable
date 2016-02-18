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
    let random = rand() // make sure all in memory DBs are unique
    realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "RealmActivityTest \(random)"))
    repository = RealmActivityRepository(realm: realm)
  }

  func testThatICanCreateIt() {
    let repository: ActivityRepository = self.repository
    XCTAssertNotNil(repository)
  }

  func testThatICanGetActivities() {
    let repository: ActivityRepository = self.repository
    let activities = repository.getAllActivities()
    XCTAssertNotNil(activities)
    XCTAssertEqual(activities.count, 0)
  }

  func testCorrectActivitiesAreRetrieved() throws {
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

  func testActivitiesCanBeFiltered() throws {
    let repository: ActivityRepository = self.repository
    let nameTest = "Workout"
    let activity1 = RealmActivity()
    activity1.name = nameTest
    let activity2 = RealmActivity()
    try realm.write {
      realm.add(activity1)
      realm.add(activity2)
    }

    let predicate = NSPredicate(format: "name = %@", nameTest)
    let activities = repository.getActivities(predicate, sortBy: nil)
    XCTAssertEqual(activities.count, 1)
    XCTAssertTrue(activities.contains({ ($0 as? RealmActivity) == activity1 }))
    XCTAssertTrue(!activities.contains({ ($0 as? RealmActivity) == activity2 }))
  }

  func testActivitiesCanBeSorted() throws {
    let repository: ActivityRepository = self.repository
    let activity1 = RealmActivity()
    activity1.name = "xyz"
    let activity2 = RealmActivity()
    activity2.name = "abc"
    try realm.write {
      realm.add(activity1)
      realm.add(activity2)
    }

    let activities = repository.getActivities(nil, sortBy: "name")
    XCTAssertEqual(activities.count, 2)
    XCTAssertEqual(activities[0] as? RealmActivity, activity2)
    XCTAssertEqual(activities[1] as? RealmActivity, activity1)
  }

}
