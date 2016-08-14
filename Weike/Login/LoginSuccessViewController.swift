//
//  LoginSuccessViewController.swift
//  Weike
//
//  Created by Danny Yulang Wang on 8/14/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

import UIKit

class LoginSuccessViewController: UIViewController {
    // MARK: Properties
    
    private let loginSuccessView = LoginSuccessView()
    
    // MARK: UIViewController
    
    override func loadView() {
        super.loadView()
        view = loginSuccessView
    }
    
}
