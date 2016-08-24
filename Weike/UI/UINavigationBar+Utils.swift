//
//  UINavigationBar+Utils.swift
//  Weike
//
//  Created by Cam on 8/24/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

extension UINavigationBar {
    // todo: we need to figure out a way to set the default nav bar
    static var `default`: UINavigationBar {
        get {
            let navBar = UINavigationBar()
            navBar.barTintColor = UIColor.main
            navBar.tintColor = UIColor.white
            navBar.barStyle = UIBarStyle.black
            navBar.setValue(true, forKey: "hidesShadow")
            return navBar
        }
    }
}
