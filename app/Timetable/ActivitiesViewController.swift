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
      dataSource?.bindToTableView(self.tableView)
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  func configureCell(cell: UITableViewCell, activity: Activity) {
    cell.textLabel?.text = activity.name
  }

  @IBAction func didTapAddActivity() {
    delegate?.addActivityForActivitiesViewController(self)
  }

  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    guard let activity = dataSource?.objectAtIndexPath(indexPath) else { return }

    delegate?.editActivity(activity, forViewController: self)
  }

  override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
    let archive = UITableViewRowAction(style: .Normal, title: "Archive") { action, index in
      print("archive")
    }

    let delete = UITableViewRowAction(style: .Default, title: "Delete") { [weak self] action, index in
      guard let this = self else { return }
      guard let activity = this.dataSource?.objectAtIndexPath(indexPath) else { return }
      this.dataSource?.removeObjectAtIndexPath(indexPath)
      this.delegate?.deleteActivity(activity, forViewController: this)
      this.tableView.reloadData()
    }

    return [delete, archive]
  }

}

protocol ActivitiesViewControllerDelegate: class {

  func addActivityForActivitiesViewController(activitiesViewController: ActivitiesViewController)
  func editActivity(activity: Activity, forViewController viewController: ActivitiesViewController)
  func deleteActivity(activity: Activity, forViewController viewController: ActivitiesViewController)

}
