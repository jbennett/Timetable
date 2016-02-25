//
//  TextFormField.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-25.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

public struct TextFormField: FormField {

  let title: String
  let value: String?

  public let cell = UITableViewCell()

  public init(title: String, value: String? = nil) {
    self.title = title
    self.value = value
  }

}
