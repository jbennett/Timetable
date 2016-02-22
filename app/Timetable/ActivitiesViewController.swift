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
    cell.detailTextLabel?.text = "\(activity.identifier)"
  }

  @IBAction func didTapAddActivity() {
    delegate?.addActivityForActivitiesViewController(self)
  }

  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    guard let activity = dataSource?.objectAtIndexPath(indexPath) else { return }

    delegate?.editActivity(activity, forViewController: self)
  }

}

protocol ActivitiesViewControllerDelegate: class {

  func addActivityForActivitiesViewController(activitiesViewController: ActivitiesViewController)
  func editActivity(activity: Activity, forViewController viewController: ActivitiesViewController)

}
