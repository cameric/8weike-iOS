//
//  EnterPasscodeViewViewController.swift
//  Weike
//
//  Created by Danny Yulang Wang on 11/3/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class EnterPasscodeViewController: WKUIViewController {
    // MARK: Properties
    
    fileprivate let enterPasscodeView = EnterPasscodeView()
    fileprivate var nextButtonItem = UIBarButtonItem()
    
    // MARK: UIViewController
    
    override func loadView() {
        super.loadView()
        view = enterPasscodeView
        enterPasscodeView.delegate = self
        configureNavBar()
        
        IRI = EnterPasscodeIRI
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
        nextButtonItem = UIBarButtonItem(title: "Next".localized(), style: .done, target: self, action: #selector(nextButtonTapped))
        navigationItem.rightBarButtonItem = nextButtonItem
    }
    
}

// MARK: EnterPasscodeViewDelegate

extension EnterPasscodeViewController: EnterPasscodeViewDelegate {
    func nextButtonTapped() {
        if enterPasscodeView.formManager.checkForm() {
            // TODO: Send Request
            let resetPasswordViewController = ResetPasswordViewController()
            self.navigationController?.pushViewController(resetPasswordViewController, animated: true)
        }
    }
    
    func resendButtonTapped() {
        enterPasscodeView.resendButtonText = "Passcode Sent".localized()
        enterPasscodeView.resendButtonEnable = false
        track(EnterPasscodeIRI)
        
        // Reset resendButton
        let dispatchTime: DispatchTime = DispatchTime.now() + 10.0
        DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
            self.enterPasscodeView.resendButtonText = "Resend Passcode".localized()
            self.enterPasscodeView.resendButtonEnable = true
        })
    }
}

// MARK: Keyboard Delegate

extension EnterPasscodeViewController: KeyboardDelegate {
    func keyboardWillShow(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double else { return }
        UIView.animate(withDuration: duration) {
            self.enterPasscodeView.topPadding = 30
        }
    }
    
    func keyboardWillHide(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double else { return }
        UIView.animate(withDuration: duration) {
            self.enterPasscodeView.topPadding = 80
        }
    }
}
