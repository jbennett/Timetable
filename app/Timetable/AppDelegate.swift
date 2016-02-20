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

    let window = UIWindow()
    ThemeController().applyStyles(window)

    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
    guard let tabController = viewController as? UITabBarController else {
      fatalError("UITabBarController not configured as root view controller")
    }

    applicationController = ApplicationController()
    applicationController?.configureTabBarControllers(tabController)

    window.rootViewController = tabController
    self.window = window
    window.makeKeyAndVisible()

    return true
  }

}
