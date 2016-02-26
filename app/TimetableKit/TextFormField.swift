//
//  TextFormField.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-25.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

public struct TextFormField: FormField {

  public let cell: UITableViewCell
  public var value: String {
    get { return textCell.value }
    set { textCell.value = value }
  }
  private let textCell: TextFormFieldCell

  public init(title: String, value: String = "") {
    self.textCell = TextFormFieldCell.fromNib()
    self.textCell.value = value
    self.textCell.valueField.placeholder = title
    self.cell = textCell
  }

  public func selectField() {
    print("select")
    textCell.becomeFirstResponder()
  }

}
