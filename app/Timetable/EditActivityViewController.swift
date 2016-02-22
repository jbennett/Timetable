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

  weak var delegate: EditActivityViewControllerDelegate?
  @IBOutlet var nameField: UITextField!

  var activity: Activity! {
    didSet { self.updateForm() }
  }

  override func viewDidLoad() {
    guard activity != nil else {
      fatalError("trying to edit activity that doesn't exist")
    }

    super.viewDidLoad()
    title = titleString()
    updateForm()
  }

  func titleString() -> String {
    if activity != nil {
      return "Edit Activity"
    } else {
      return "Add Activity"
    }
  }

  func updateForm() {
    guard isViewLoaded() else { return }

    nameField.text = activity.name
  }

  @IBAction func didTapCancel() {
    closeKeyboard()
    delegate?.editActivityViewController(self, didCancelEditingActivity: activity)
  }

  @IBAction func didTapSave() {
    let name = nameField.text ?? ""
    let identifier = self.activity.identifier
    let activity = Activity(name: name, identifier: identifier)

    if activity.isValid() {
      closeKeyboard()
      delegate?.editActivityViewController(self, didSaveActivity: activity)
    } else {
      // TODO: notify user of error
    }
  }

  func closeKeyboard() {
    self.view.endEditing(true)
  }

  class func fromStoryboard() -> EditActivityViewController {
    let storyboard = UIStoryboard(name: String(EditActivityViewController), bundle: nil)
    guard let viewController = storyboard.instantiateInitialViewController() as? EditActivityViewController else {
      fatalError("Could not instantiate correct View Controller class")
    }

    return viewController
  }
}

protocol EditActivityViewControllerDelegate: class {

  func editActivityViewController(viewController: EditActivityViewController, didCancelEditingActivity activity: Activity)
  func editActivityViewController(viewController: EditActivityViewController, didSaveActivity activity: Activity)

}
