//
//  FormDataSource.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-26.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

public class FormDataSource: NSObject, UITableViewDataSource {

  let form: Form
  init(form: Form) {
    self.form = form
  }

  public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return form.sections.count
  }

  public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return form.sections[section].fields.count
  }

  public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let row = form.sections[indexPath.section].fields[indexPath.row]
    return row.cell
  }

}
