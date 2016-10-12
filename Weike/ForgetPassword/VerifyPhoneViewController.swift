//
//  VerifyPhoneViewController.swift
//  Weike
//
//  Created by Danny Yulang Wang on 8/23/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

import UIKit

class VerifyPhoneViewController: UIViewController {
    // MARK: Properties

    fileprivate let verifyPhoneView = VerifyPhoneView()

    // MARK: UIViewController

    override func loadView() {
        super.loadView()
        verifyPhoneView.delegate = self
        view = verifyPhoneView
        self.title = "Verify Phone Number"
    }


}

extension VerifyPhoneViewController: VerifyPhoneDelegate {
    func getVerificationCodeButtonTapped(){

    }

    func confirmButtonTapped(){
        let resetPasswordViewController = ResetPasswordViewController()
        self.navigationController?.pushViewController(resetPasswordViewController, animated: true)
        print("Reset button pressed")
    }
}
