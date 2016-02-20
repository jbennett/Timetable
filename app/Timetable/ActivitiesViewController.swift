//
//  ActivitiesViewController.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-19.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit
import TimetableKit

class ActivitiesViewController: UITableViewController {

  weak var delegate: ActivitiesViewControllerDelegate?
  var dataSource: SimpleDataSource<Activity>? {
    didSet {
      dataSource?.cellConfiguration = configureCell
      tableView.dataSource = dataSource
      tableView.reloadData()
    }
  }

  func configureCell(cell: UITableViewCell, activity: Activity) {
    cell.textLabel?.text = activity.name
  }

  @IBAction func didTapAddActivity() {
    delegate?.addActivityForActivitiesViewController(self)
  }

}

protocol ActivitiesViewControllerDelegate: class {

  func addActivityForActivitiesViewController(activitiesViewController: ActivitiesViewController)

}
