//
//  UITextField+Utils.swift
//  Weike
//
//  Created by Cam on 8/21/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

import JVFloatLabeledTextField

extension UITextField {
    static var floatLabeled: JVFloatLabeledTextField {
        let textField = JVFloatLabeledTextField()
        textField.floatingLabelTextColor = UIColor.gray
        textField.floatingLabelActiveTextColor = UIColor.main
        return textField
    }
}
