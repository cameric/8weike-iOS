//
//  LoginViewController.swift
//  Weike
//
//  Created by Cam on 8/13/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

final class LoginViewController: WKUIViewController {
    // MARK: Properties

    fileprivate let loginView = LoginView()
    fileprivate var loginButtonItem = UIBarButtonItem()
    var phone: String? { get { return loginView.phone } }
    var password: String? { get { return loginView.password } }
    var loginTask: URLSessionDataTask? { didSet { userInteractionEnable(loginTask == nil) } }

    // MARK: UIViewController

    override func loadView() {
        super.loadView()
        loginView.delegate = self
        view = loginView
        configureNavBar()
        
        IRI = loginViewIRI

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
        loginButtonItem = UIBarButtonItem(title: "Next".localized(), style: .done, target: self, action: #selector(loginButtonTapped))
        navigationItem.rightBarButtonItem = loginButtonItem
    }
    
    fileprivate func login() {
        if (loginTask != nil) {
            return
        }
        loginTask = LoginRequests.loginTask(phone: phone!, password: password!, completion: { (error) in
            self.loginTask = nil
            if error == nil {
                let controller = SuccessViewController(message: "Login Successful".localized())
                self.navigationController?.pushViewController(controller, animated: true)
            } else {
                let alert = UIAlertController(title: "Error".localized(), message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK".localized(), style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        })
        loginTask?.resume()
        
        // Set request time out
        let dispatchTime: DispatchTime = DispatchTime.now() + SignupRequests.timeout
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.loginTask?.cancel()
            self.loginTask = nil
        }

    }
    
    fileprivate func userInteractionEnable(_ enabled: Bool) {
        loginView.isUserInteractionEnabled = enabled
        if enabled {
            loginButtonItem.title = "Next".localized()
            loginButtonItem.customView = nil
        } else {
            loginButtonItem.title = nil
            let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
            loginButtonItem.customView = activityIndicator
            activityIndicator.startAnimating()
        }
    }
}

// MARK: LoginViewDelegate

extension LoginViewController: LoginViewDelegate {
    func loginButtonTapped() {
        print("Login button pressed")
        if loginView.formManager.checkForm() {
            login()
        }
    }

    func forgetPasswordTapped() {
        let verifyPhoneViewController = VerifyPhoneViewController()
        self.navigationController?.pushViewController(verifyPhoneViewController, animated: true)
        print("Forgot password button pressed")
    }
    
    func signUpButtonTapped() {
        let signUpViewController = SignupViewController()
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
}

// MARK: Keyboard Delegate

extension LoginViewController: KeyboardDelegate {
    func keyboardWillShow(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double else { return }
        UIView.animate(withDuration: duration) {
            self.loginView.topPadding = 30
        }
    }
    
    func keyboardWillHide(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double else { return }
        UIView.animate(withDuration: duration) {
            self.loginView.topPadding = 80
        }
    }
}
