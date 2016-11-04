//
//  EnterPhoneNumberViewController.swift
//  Weike
//
//  Created by Danny Yulang Wang on 11/3/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

final class EnterPhoneNumberViewController: WKUIViewController {
    // MARK: Properties
    
    fileprivate let enterPhoneNumberView = EnterPhoneNumberView()
    fileprivate var nextButtonItem = UIBarButtonItem()
    var phone: String? { get { return enterPhoneNumberView.phone } }
    
    // MARK: UIViewController
    
    override func loadView() {
        super.loadView()
        enterPhoneNumberView.delegate = self
        view = enterPhoneNumberView
        configureNavBar()
        
        IRI = EnterPhoneNumberViewIRI
        
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
    
    fileprivate func userInteractionEnable(_ enabled: Bool) {
        enterPhoneNumberView.isUserInteractionEnabled = enabled
        if enabled {
            nextButtonItem.title = "Next".localized()
            nextButtonItem.customView = nil
        } else {
            nextButtonItem.title = nil
            let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
            nextButtonItem.customView = activityIndicator
            activityIndicator.startAnimating()
        }
    }
}

// MARK: EnterPhoneNumberViewDelegate

extension EnterPhoneNumberViewController: EnterPhoneNumberViewDelegate {
    func nextButtonTapped() {
        if enterPhoneNumberView.formManager.checkForm() {
            // TODO: Send Request
            let enterPasscodeViewController = EnterPasscodeViewController()
            self.navigationController?.pushViewController(enterPasscodeViewController, animated: true)
        }
    }
}

// MARK: Keyboard Delegate

extension EnterPhoneNumberViewController: KeyboardDelegate {
    func keyboardWillShow(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double else { return }
        UIView.animate(withDuration: duration) {
            self.enterPhoneNumberView.topPadding = 30
        }
    }
    
    func keyboardWillHide(_ notification: NSNotification) {
        guard let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double else { return }
        UIView.animate(withDuration: duration) {
            self.enterPhoneNumberView.topPadding = 80
        }
    }
}
