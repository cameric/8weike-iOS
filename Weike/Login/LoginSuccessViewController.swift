//
//  LoginSuccessViewController.swift
//  Weike
//
//  Created by Danny Yulang Wang on 8/14/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class LoginSuccessViewController: UIViewController {
    // MARK: Properties
    
    private let loginSuccessView = LoginSuccessView()
    
    // MARK: UIViewController
    
    override func loadView() {
        super.loadView()
        view = loginSuccessView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Automatically load next view
        let dispatchTime: DispatchTime = DispatchTime.now() + 2.0
        DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: {
            if self.isBeingPresented {
                self.dismiss(animated: true, completion: nil)
            }
        })
    }
    
}
