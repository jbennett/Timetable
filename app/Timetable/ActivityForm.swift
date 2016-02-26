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

  let nameField: TextFormField

  init(activity: Activity) {
    nameField = TextFormField(title: "Name", value: activity.name)
    super.init()

    sections = [
      FormSection(fields: [nameField]),
    ]
  }

}
