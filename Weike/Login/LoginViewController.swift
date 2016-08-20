//
//  LoginViewController.swift
//  Weike
//
//  Created by Cam on 8/13/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class LoginViewController: UIViewController {
    // MARK: Properties
    
    private let loginView = LoginView()
    
    // MARK: UIViewController
    
    override func loadView() {
        super.loadView()
        view = loginView
        self.title = "Login"
        
        // NavigationBar style
        if let navBar = navigationController?.navigationBar {
            navBar.barTintColor = UIColor.orange
            navBar.tintColor = UIColor.white
            navBar.barStyle = UIBarStyle.black
            navBar.setValue(true, forKey: "hidesShadow")
            
        } else {
            print("View not nested in Navigation Controller")
        }
        
        // Just for testing purposes
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(testNextAction))
    }
    
    // MARK: UINavigationController
    
    func testNextAction(sender: UIBarButtonItem) {
        let loginSuccessViewController = LoginSuccessViewController()
        self.navigationController?.pushViewController(loginSuccessViewController, animated: true)
        print("Done button pressed")
    }
    
}
