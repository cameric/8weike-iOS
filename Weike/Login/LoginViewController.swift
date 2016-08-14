//
//  LoginViewController.swift
//  Weike
//
//  Created by Cam on 8/13/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class LoginViewController: UIViewController {
    // MARK: Properties
    
    private let loginView = LoginView()
    
    // MARK: UIViewController
    
    override func loadView() {
        super.loadView()
        view = loginView
    }
    
}
