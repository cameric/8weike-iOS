//
//  AppDelegate.swift
//  Weike
//
//  Created by Weiyu Zhou on 7/24/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

import UIKit
import Mixpanel
import ChatKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate {

    var window: UIWindow?

    var discoverViewController: DiscoverViewController?
    var messageViewController: MessageViewController?
    var profileViewController: ProfileTableViewController?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        setupMixpanel()
        setupLeanCloud()

        self.window = UIWindow()

        discoverViewController = DiscoverViewController()
        messageViewController = MessageViewController()
        profileViewController = ProfileTableViewController()

        let navController1 = UINavigationController(rootViewController: discoverViewController!)
        let navController2 = UINavigationController(rootViewController: messageViewController!)
        let navController3 = UINavigationController(rootViewController: profileViewController!)

        navController1.tabBarItem = UITabBarItem(title: "Discover", image: nil, selectedImage: nil)
        navController2.tabBarItem = UITabBarItem(title: "Message", image: nil, selectedImage: nil)
        navController3.tabBarItem = UITabBarItem(title: "Profile", image: nil, selectedImage: nil)

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navController1,
                                            navController2,
                                            navController3]
        tabBarController.delegate = self
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        LCChatKit.sharedInstance().syncBadge()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        LCChatKit.sharedInstance().syncBadge()
    }

    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        if application.applicationState == .active {
            // App is active
        } else {
            LCChatKit.sharedInstance().didReceiveRemoteNotification(userInfo)
        }
    }

    // MARK - Setup Third Party

    private func setupMixpanel() {
        let token = "ff3427461722afac1dd1312b42fa7b54"
        _ = Mixpanel.sharedInstance(withToken: token)
    }

    private func setupLeanCloud() {
        LCChatKit.setAppId("cedm8TEgr8pziVzQMGCljPA3-gzGzoHsz", appKey: "46HvkDRV2zdmnoNK0RxjltpQ")
        AVOSCloud.registerForRemoteNotification()
        AVIMClient.setTimeoutIntervalInSeconds(20)
    }

    // MARK - UITabBarControllerDelegate



}
