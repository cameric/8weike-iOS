//
//  SignupViewController.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/2/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    // MARK: Properties
    
    private let signupView = SignupView()
    
    // MARK: UIViewController
    
    override func loadView() {
        super.loadView()
        signupView.delegate = self
        view = signupView
        self.title = "Signup"
        
        // NavigationBar style
        if let navBar = navigationController?.navigationBar {
            navBar.barTintColor = UIColor.orange
            navBar.tintColor = UIColor.white
            navBar.barStyle = UIBarStyle.black
            navBar.setValue(true, forKey: "hidesShadow")
        } else {
            print("View not nested in Navigation Controller")
        }
    }
}

extension SignupViewController: SignupViewDelegate {
    func getVerificationCodeButtonTapped(){
        
    }
    
    func confirmButtonTapped(){
        let signupSuccessViewController = SuccessViewController(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0), message: "Signup Successful")
        self.navigationController?.pushViewController(signupSuccessViewController, animated: true)
        print("Signup button pressed")
    }
}
