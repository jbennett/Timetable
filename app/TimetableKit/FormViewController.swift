//
//  FormViewController.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-26.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

public class FormViewController: UITableViewController {

  public var dataSource: FormDataSource! {
    didSet {
      self.tableView.dataSource = dataSource
    }
  }
  
  public override func viewDidLoad() {
    dataSource.form
      .sections.first?
      .fields.first?
      .selectField()
  }

  public override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    dataSource.fieldAtIndexPath(indexPath).selectField()
  }

}
