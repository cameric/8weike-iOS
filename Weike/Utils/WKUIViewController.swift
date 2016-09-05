//
//  WKUIViewController.swift
//  Weike
//
//  Created by Cam on 8/25/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class WKUIViewController: UIViewController {

    var IRI: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // NavigationBar style
        if let navBar = navigationController?.navigationBar {
            navBar.barTintColor = UIColor.main
            navBar.tintColor = UIColor.white
            navBar.barStyle = UIBarStyle.black
            navBar.setValue(true, forKey: "hidesShadow")
            navBar.isTranslucent = false
            navBar.isHidden = false
        } else {
            print("View not nested in Navigation Controller")
        }

        if IRI != nil { track(event: IRI!) }
    }
}
