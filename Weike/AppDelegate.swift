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
class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate {
    var window: UIWindow?
    var currentUser: User?
    var theme = UITheme.none
    static var shared: AppDelegate? { get { return UIApplication.shared.delegate as? AppDelegate } }

    var discoverViewController: DiscoverViewController?
    var messageViewController: MessageViewController?
    var moreViewController: MoreTableViewController?

    // MARK: UIApplicationDelegate

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        setupMixpanel()

        self.window = UIWindow()

        discoverViewController = DiscoverViewController()
        messageViewController = MessageViewController()
        moreViewController = MoreTableViewController()

        let navController1 = UINavigationController(rootViewController: discoverViewController!)
        let navController2 = UINavigationController(rootViewController: messageViewController!)
        let navController3 = UINavigationController(rootViewController: moreViewController!)

        navController1.tabBarItem = UITabBarItem(title: "Discover", image: nil, selectedImage: nil)
        navController2.tabBarItem = UITabBarItem(title: "Message", image: nil, selectedImage: nil)
        navController3.tabBarItem = UITabBarItem(title: "More", image: nil, selectedImage: nil)

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navController1,
                                            navController2,
                                            navController3]
        tabBarController.delegate = self
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()

        let navController4 = UINavigationController(rootViewController: LandingViewController())
        tabBarController.present(navController4, animated: true) {}
        
        return true
    }

    // MARK: Setup Third Party

    private func setupMixpanel() {
        let token = "ff3427461722afac1dd1312b42fa7b54"
        _ = Mixpanel.sharedInstance(withToken: token)
    }

    // MARK: UITabBarControllerDelegate

    // MARK: SharedDelegate
    

}
