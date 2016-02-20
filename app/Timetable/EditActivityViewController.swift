//
//  EditActivityViewController.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-20.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit
import TimetableKit

class EditActivityViewController: UITableViewController {

  var activity: Activity?

  override func viewDidLoad() {
    super.viewDidLoad()
    title = titleString()
  }

  func titleString() -> String {
    if activity != nil {
      return "Edit Activity"
    } else {
      return "Add Activity"
    }
  }

  @IBAction func didTapCancel() {
    dismissViewControllerAnimated(true, completion: nil)
  }

  @IBAction func didTapSave() {
    // TODO: save/create activity
    dismissViewControllerAnimated(true, completion: nil)
  }

  class func fromStoryboard() -> EditActivityViewController {
    let storyboard = UIStoryboard(name: String(EditActivityViewController), bundle: nil)
    guard let viewController = storyboard.instantiateInitialViewController() as? EditActivityViewController else {
      fatalError("Could not instantiate correct View Controller class")
    }

    return viewController
  }
}
