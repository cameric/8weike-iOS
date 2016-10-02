//
//  ResetPasswordViewController.swift
//  Weike
//
//  Created by Danny Yulang Wang on 8/23/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class ResetPasswordViewController: UIViewController {
    // MARK: Properties

    private let resetPasswordView = ResetPasswordView()

    // MARK: UIViewController

    override func loadView() {
        super.loadView()
        resetPasswordView.delegate = self
        view = resetPasswordView
        self.title = "Reset Password"

        // NavigationBar style
        if let navBar = navigationController?.navigationBar {
            navBar.barTintColor = UIColor.main
            navBar.tintColor = UIColor.white
            navBar.barStyle = UIBarStyle.black
            navBar.setValue(true, forKey: "hidesShadow")
        } else {
            print("View not nested in Navigation Controller")
        }
    }
}

extension ResetPasswordViewController: ResetPasswordViewDelegate {

    func confirmButtonTapped(){
        // Pop twice to get to login again
        if let viewControllers = self.navigationController?.viewControllers {
            _ = self.navigationController?.popToViewController(viewControllers[viewControllers.count - 2 - 1], animated: true)
        }
        print("Confirm button pressed")
    }
}
