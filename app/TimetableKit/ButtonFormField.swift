//
//  ButtonFormField.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-28.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation

public class ButtonFormField: FormField {

  public var callback: (ButtonFormField -> Void)?
  public let cell: UITableViewCell
  private let buttonCell: ButtonFormFieldCell

  public init(title: String) {
    self.buttonCell = ButtonFormFieldCell.fromNib()
    self.buttonCell.title = title
    self.cell = buttonCell
    
    self.buttonCell.callback = self.fieldCallback
  }
  
  func fieldCallback(buttonFormField: ButtonFormFieldCell) {
    self.selectField()
  }

  public func selectField() {
    callback?(self)
  }

}
