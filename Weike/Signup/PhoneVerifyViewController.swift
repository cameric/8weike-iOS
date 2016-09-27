//
//  PhoneVerifyViewController.swift
//  Weike
//
//  Created by Weiyu Zhou on 9/26/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class PhoneVerifyViewController: WKUIViewController {
    // MARK: Properties

    fileprivate let phoneVerifyView = PhoneVerifyView()

    // MARK: UIViewController

    override func loadView() {
        super.loadView()
        view = phoneVerifyView
        phoneVerifyView.delegate = self

        IRI = phoneVerifyIRI
    }
}

// MARK: PhoneVerifyViewDelegate

extension PhoneVerifyViewController: PhoneVerifyViewDelegate {
    func resendButtonTapped() {
        phoneVerifyView.resendButtonText = "Passcode Sent".localized()
        phoneVerifyView.resendButtonEnable = false
        track(event: phoneVerifyResendIRI)

        // Reset resendButton
        let dispatchTime: DispatchTime = DispatchTime.now() + 10.0
        DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
            self.phoneVerifyView.resendButtonText = "Resend Passcode".localized()
            self.phoneVerifyView.resendButtonEnable = true
        })
    }
}
