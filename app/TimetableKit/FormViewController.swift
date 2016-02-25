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

}
