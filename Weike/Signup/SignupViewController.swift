//
//  SignupViewController.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/2/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    // MARK: Properties

    private let signupView = SignupView()

    // MARK: UIViewController

    override func loadView() {
        super.loadView()
        signupView.delegate = self
        view = signupView
        self.title = "Sign up"

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

extension SignupViewController: SignupViewDelegate {

}
