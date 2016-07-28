//
//  AppDelegate.swift
//  Weike
//
//  Created by Weiyu Zhou on 7/24/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

import UIKit
import Mixpanel

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    setupMixpanel()
    return true
  }

  // MARK - Mixpanel Tracking

  func setupMixpanel() {
    let token = "ff3427461722afac1dd1312b42fa7b54"
    _ = Mixpanel.sharedInstance(withToken:token)
  }


}
