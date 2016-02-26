//
//  SimpleDataSource.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-19.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

public class SimpleDataSource<T>: NSObject, UITableViewDataSource {

  var tableView: UITableView?
  let cellIdentifier: String

  public var data: [T] {
    didSet {
      self.tableView?.reloadData()
    }
  }
  public var cellConfiguration: ((cell: UITableViewCell, object: T) -> Void)?

  public init(data: [T], cellIdentifier: String) {
    self.data = data
    self.cellIdentifier = cellIdentifier
  }

  public func bindToTableView(tableView: UITableView) {
    self.tableView = tableView
    tableView.dataSource = self
  }

  public func objectAtIndexPath(indexPath: NSIndexPath) -> T {
    return data[indexPath.row]
  }

  public func removeObjectAtIndexPath(indexPath: NSIndexPath) {
    data.removeAtIndex(indexPath.row)
  }

  public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }

  public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
    let object = data[indexPath.row]

    cellConfiguration?(cell: cell, object: object)
    return cell
  }

}
