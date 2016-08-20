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
        
        // I tried writing this to UIButton extension, but selector was not working in that case, I'll fix it next.
        let backButton = UIButton(type: .custom)
        // backButton.setImage(UIImage(named: "BackButton.png"), forState: .Normal)
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(UIColor.white, for: .normal) // Back button currently can be pressed but is not showing up.
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
    }
    
    // MARK: UINavigationController
    func backAction(sender: UIBarButtonItem) {
        print("Back button pressed")
    }
    
}
