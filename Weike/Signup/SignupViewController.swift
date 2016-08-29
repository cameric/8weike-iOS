//
//  SignupViewController.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/2/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class SignupViewController: UIViewController {
    // MARK: Properties

    private let signupView = SignupView()

    // MARK: UIViewController

    override func loadView() {
        super.loadView()
        signupView.delegate = self
        view = signupView
        self.title = "Sign Up"

        // NavigationBar style
        if let navBar = navigationController?.navigationBar {
            navBar.barTintColor = .main
            navBar.tintColor = .white
            navBar.barStyle = .black
            navBar.setValue(true, forKey: "hidesShadow")
        } else {
            print("View not nested in Navigation Controller")
        }
    }
}

extension SignupViewController: SignupViewDelegate {
    func signupButtonTapped() {
        let controller = SignupUsernameViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
