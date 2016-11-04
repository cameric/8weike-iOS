//
//  ResetPasswordViewController.swift
//  Weike
//
//  Created by Danny Yulang Wang on 8/23/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class ResetPasswordViewController: WKUIViewController {
    // MARK: Properties
    
    fileprivate let resetPasswordView = ResetPasswordView()
    fileprivate var loginButtonItem = UIBarButtonItem()
    var password: String? { get { return resetPasswordView.password } }
    var confirmPassword: String? { get { return resetPasswordView.confirmPassword } }
    
    // MARK: UIViewController
    
    override func loadView() {
        super.loadView()
        resetPasswordView.delegate = self
        view = resetPasswordView
        configureNavBar()
        
        IRI = ResetPasswordViewIRI
        
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
        loginButtonItem = UIBarButtonItem(title: "Confirm".localized(), style: .done, target: self, action: #selector(confirmButtonTapped))
        navigationItem.rightBarButtonItem = loginButtonItem
    }
}

// MARK: resetPasswordViewDelegate

extension ResetPasswordViewController: ResetPasswordViewDelegate {
    func confirmButtonTapped() {
        if resetPasswordView.formManager.checkForm() {
            // TODO: Send Request
            dismiss(animated: true, completion: nil)
        }
    }
}

// MARK: Keyboard Delegate

extension ResetPasswordViewController: KeyboardDelegate {
    func keyboardWillShow(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double else { return }
        UIView.animate(withDuration: duration) {
            self.resetPasswordView.topPadding = 30
        }
    }
    
    func keyboardWillHide(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double else { return }
        UIView.animate(withDuration: duration) {
            self.resetPasswordView.topPadding = 80
        }
    }
}

