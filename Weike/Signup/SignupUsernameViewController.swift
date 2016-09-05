//
//  SignupUsernameViewController.swift
//  Weike
//
//  Created by Cam on 8/24/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class SignupUsernameViewController: WKUIViewController {
    // MARK: Properties

    private let signupUsernameView = SignupUsernameView()

    // MARK: UIViewController

    override func loadView() {
        super.loadView()
        view = signupUsernameView
        self.title = "Sign Up"
    }
}
