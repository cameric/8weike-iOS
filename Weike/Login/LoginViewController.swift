//
//  LoginViewController.swift
//  Weike
//
//  Created by Cam on 8/13/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

final class LoginViewController: WKUIViewController {
    // MARK: Properties

    private let loginView = LoginView()
    var phone: String? { get { return loginView.phone } }
    var password: String? { get { return loginView.password } }

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
        LoginRequests.login(phone: phone!, password: password!, completion: { (user, error) in
            guard let _ = user else {
                return
            }
            let loginSuccessViewController = SuccessViewController(message: "Login Successful")
            self.navigationController?.pushViewController(loginSuccessViewController, animated: true)
            print("Login button pressed")
        })
    }

    func forgetPasswordTapped() {
        let verifyPhoneViewController = VerifyPhoneViewController()
        self.navigationController?.pushViewController(verifyPhoneViewController, animated: true)
        print("Forgot password button pressed")
    }
}
