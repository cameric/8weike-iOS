//
//  SignupViewController.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/2/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

final class SignupViewController: WKUIViewController {
    // MARK: Properties

    fileprivate let signupView = SignupView()
    fileprivate var signupButtonItem = UIBarButtonItem()
    var phone: String? { get { return signupView.phone } }
    var password: String? { get { return signupView.password } }

    // MARK: UIViewController

    override func loadView() {
        super.loadView()
        signupView.delegate = self
        view = signupView
        configureNavBar()

        IRI = signupViewIRI
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startListenToKeyboardEvent()

    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopListenToKeyboardEvent()
    }

    private func configureNavBar() {
        // Configure left nav bar
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissAnimated))

        // Configure right nav bar
        signupButtonItem = UIBarButtonItem(title: "Next".localized(), style: .done, target: self, action: #selector(signupButtonTapped))
        navigationItem.rightBarButtonItem = signupButtonItem
    }

    fileprivate func signup() {
        SignupRequests.signup(phone: phone!, password: password!, completion: { (error) in
            self.userInteractionEnable(true)
            if error == nil {
                let controller = PhoneVerifyViewController()
                self.navigationController?.pushViewController(controller, animated: true)
            } else {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        })
    }

    fileprivate func userInteractionEnable(_ enabled: Bool) {
        signupView.isUserInteractionEnabled = enabled
        if enabled {
            signupButtonItem.title = "Next".localized()
            signupButtonItem.customView = nil
        } else {
            signupButtonItem.title = nil
            let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
            signupButtonItem.customView = activityIndicator
            activityIndicator.startAnimating()
        }
    }
}

// MARK: SignupViewDelegate

extension SignupViewController: SignupViewDelegate {
    func signupButtonTapped() {
        if signupView.formManager.checkForm() {
            userInteractionEnable(false)
            signup()
        }
    }
}

// MARK: Keyboard Delegate

extension SignupViewController: KeyboardDelegate {
    func keyboardWillShow(notification: NSNotification) {
        guard let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double else { return }
        UIView.animate(withDuration: duration) {
            self.signupView.topPadding = CGFloat(30)
        }
    }

    func keyboardWillHide(notification: NSNotification) {
        guard let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double else { return }
        UIView.animate(withDuration: duration) {
            self.signupView.topPadding = CGFloat(80)
        }
    }
}
