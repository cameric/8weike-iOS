//
//  SignupUsernameViewController.swift
//  Weike
//
//  Created by Cam on 8/24/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class SignupUsernameViewController: WKUIViewController {
    // MARK: Properties

    fileprivate let signupUsernameView = SignupUsernameView()

    // MARK: UIViewController

    override func loadView() {
        super.loadView()
        view = signupUsernameView
        signupUsernameView.delegate = self
        self.title = "Nickname"
    }
}

extension SignupUsernameViewController: SignupUsernameViewDelegate {
    func confirmUsernameButtonTapped() {
        SignupRequests.nickname(signupUsernameView.username!) { (error) in
            if error == nil {
                self.dismiss(animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
