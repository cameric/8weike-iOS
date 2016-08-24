//
//  SignupUsernameViewController.swift
//  Weike
//
//  Created by Cam on 8/24/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class SignupUsernameViewController: UIViewController {
    // MARK: Properties

    private let signupUsernameView = SignupUsernameView()

    // MARK: UIViewController

    override func loadView() {
        super.loadView()
        view = signupUsernameView
        self.title = "Sign Up"

        // NavigationBar style
        if let navBar = navigationController?.navigationBar {
            navBar.barTintColor = UIColor.main
            navBar.tintColor = UIColor.white
            navBar.barStyle = UIBarStyle.black
            navBar.setValue(true, forKey: "hidesShadow")
        } else {
            print("View not nested in Navigation Controller")
        }
    }
}
