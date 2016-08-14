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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
