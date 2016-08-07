//
//  LoginViewController.swift
//  Weike
//
//  Created by Weiyu Zhou on 7/29/16.
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
    }

}

// MARK: LoginViewDelegate
extension LoginViewController: LoginViewDelegate {
    func LoginViewSkipButtonTapped() {
        dismiss(animated: true, completion: nil)
    }

    func LoginViewLoginButtonTapped() {
        
    }

    func LoginViewSignupButtonTapped() {
        
    }
}
