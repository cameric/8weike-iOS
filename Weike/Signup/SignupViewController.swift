//
//  SignupViewController.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/2/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class SignupViewController: WKUIViewController {
    // MARK: Properties

    private let signupView = SignupView()
    var phone: String? { get { return signupView.phone } }
    var password: String? { get { return signupView.password } }

    // MARK: UIViewController

    override func loadView() {
        super.loadView()
        signupView.delegate = self
        view = signupView
        self.title = "Sign Up"
    }
}

extension SignupViewController: SignupViewDelegate {
    func signupButtonTapped() {
        SignupRequests.signup(phone: phone!, password: password!, completion: { (user, error) in
            guard let _ = user else {
                return
            }

            let controller = SignupUsernameViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        })
    }
}
