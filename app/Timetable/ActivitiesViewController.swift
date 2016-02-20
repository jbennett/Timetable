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
    showEditViewForActivity(nil)
  }

  func showEditViewForActivity(activity: Activity?) {
    let editViewController = EditActivityViewController.fromStoryboard()
    editViewController.activity = activity
    let navViewController = UINavigationController(rootViewController: editViewController)

    presentViewController(navViewController, animated: true, completion: nil)
  }

}
