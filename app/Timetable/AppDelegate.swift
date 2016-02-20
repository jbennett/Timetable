//
//  AppDelegate.swift
//  Timetable
//
//  Created by Jonathan Bennett on 2016-02-17.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var applicationController: ApplicationController?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    guard let tabController = window?.rootViewController as? UITabBarController else {
      fatalError("UITabBarController not configured as root view controller")
    }

    window?.tintColor = UIColor(red:0.1, green:0.16, blue:0.24, alpha:1)

    applicationController = ApplicationController()
    applicationController?.configureTabBarControllers(tabController)

    return true
  }

}
