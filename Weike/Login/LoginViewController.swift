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
        loginView.delegate = self
        view = loginView
        self.title = "Login"

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

// MARK: LoginViewDelegate

extension LoginViewController: LoginViewDelegate {
    func loginButtonTapped() {
        let loginSuccessViewController = SuccessViewController(message: "Login Successful")
        self.navigationController?.pushViewController(loginSuccessViewController, animated: true)
        print("Login button pressed")
    }

    func forgetPasswordTapped() {

    }
}
