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
        self.title = "Login".localized()
        IRI = loginViewIRI

    }
}

// MARK: LoginViewDelegate

extension LoginViewController: LoginViewDelegate {
    func loginButtonTapped() {
        print("Login button pressed")
        LoginRequests.login(phone: phone!, password: password!, completion: { (user, error) in
            guard let _ = user else {
                return
            }
            if error == nil {
                let loginSuccessViewController = SuccessViewController(message: "Login Successful".localized())
                self.navigationController?.pushViewController(loginSuccessViewController, animated: true)
            } else {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK".localized(), style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }


        })
    }

    func forgetPasswordTapped() {
        let verifyPhoneViewController = VerifyPhoneViewController()
        self.navigationController?.pushViewController(verifyPhoneViewController, animated: true)
        print("Forgot password button pressed")
    }
}
