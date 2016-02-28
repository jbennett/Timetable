//
//  ButtonFormFieldCell.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-29.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

public class ButtonFormFieldCell: UITableViewCell {
  
  @IBOutlet var button: UIButton!
  
  public var callback: (ButtonFormFieldCell -> Void)?
  
  public var title: String {
    set { button.setTitle(newValue, forState: .Normal) }
    get { return button.titleForState(.Normal) ?? "" }
  }
  
  public static func fromNib() -> ButtonFormFieldCell {
    let bundle = NSBundle(forClass: ButtonFormFieldCell.self)
    let nibObjects = bundle.loadNibNamed("FormFieldCells", owner: nil, options: nil)
    
    if let cell = nibObjects.flatMap({ $0 as? ButtonFormFieldCell }).first {
      return cell
    } else {
      fatalError("Cannot load cell from nib")
    }
  }
  
  @IBAction func buttonCallback() {
    callback?(self)
  }
  
}
