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

        IRI = signupViewIRI
    }
}

extension SignupViewController: SignupViewDelegate {
    func signupButtonTapped() {
        SignupRequests.signup(phone: phone!, password: password!, completion: { (error) in
            if error == nil {
                let controller = SignupUsernameViewController()
                self.navigationController?.pushViewController(controller, animated: true)
            } else {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        })
    }
}
