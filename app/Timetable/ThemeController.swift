//
//  ThemeController.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-20.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

class ThemeController {

  static let darkBrandColor = UIColor(red:0.1, green:0.16, blue:0.24, alpha:1)
  static let brightBrandColor = UIColor(red:0.89, green:0.43, blue:0.18, alpha:1)

  func applyStyles(window: UIWindow) {
    applyApplicationStyles()
    applyWindowStyles(window)
    applyTabBarStyles()
    applyNavBarStyles()
  }

  func applyApplicationStyles() {
    let application = UIApplication.sharedApplication()
    application.statusBarStyle = .LightContent
  }

  func applyWindowStyles(window: UIWindow) {
    window.tintColor = ThemeController.brightBrandColor
  }

  func applyTabBarStyles() {
    let barAppearance = UITabBar.appearance()
    barAppearance.barTintColor = ThemeController.darkBrandColor

    // TODO: unselected image color
//    let itemAppearance = UITabBarItem.appearance()
//    itemAppearance.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState: .Normal)
//    itemAppearance.setTitleTextAttributes([NSForegroundColorAttributeName: ThemeController.brightBrandColor], forState: .Selected)
  }

  func applyNavBarStyles() {
    let barAppearance = UINavigationBar.appearance()

    barAppearance.barTintColor = ThemeController.darkBrandColor
    barAppearance.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
  }

}
