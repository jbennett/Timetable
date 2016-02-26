//
//  TextFormFieldCell.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-26.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

public class TextFormFieldCell: UITableViewCell {

  @IBOutlet var valueField: UITextField!

  public var value: String {
    get { return valueField.text ?? "" }
    set { valueField.text = value }
  }

  public override func becomeFirstResponder() -> Bool {
    return valueField.becomeFirstResponder()
  }

  public static func fromNib() -> TextFormFieldCell {
    let bundle = NSBundle(forClass: TextFormFieldCell.self)
    let nibObjects = bundle.loadNibNamed("TextFormFieldCell", owner: nil, options: nil)

    guard let cell = nibObjects.first as? TextFormFieldCell else { fatalError("Cannot load cell from nib") }

    return cell
  }

}
