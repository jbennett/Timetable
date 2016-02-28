//
//  ActivityForm.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-25.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit
import TimetableKit

class ActivityForm: Form {
  
  // #Mark: Accessors
  var name: String {
    return nameField.value
  }
  
  // #Mark: Fields
  let nameField: TextFormField
  let addPatternField: ButtonFormField

  init(activity: Activity) {
    nameField = TextFormField(title: "Activity Title", value: activity.name)
    addPatternField = ButtonFormField(title: "Add Pattern")
    super.init()

    addPatternField.callback = self.addPattern
    
    sections = [
      FormSection(fields: [nameField]),
      FormSection(fields: [addPatternField])
    ]
  }
  
  func addPattern(field: ButtonFormField) {
    print("add new pattern")
  }

}
