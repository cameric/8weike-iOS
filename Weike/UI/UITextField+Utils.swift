//
//  UITextField+Utils.swift
//  Weike
//
//  Created by Cam on 8/21/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

import VLRTextField
private let floatingLabelYPadding = CGFloat(-15)

extension UITextField {
    static var floatLabeled: VLRTextField {
        let textField = VLRTextField()
        textField.placeholderColor = .white
        textField.floatingLabelTextColor = .white
        textField.floatingLabelActiveValidTextColor = .white
        textField.floatingLabelActiveUnvalidTextColor = .white
        textField.shouldCheckWhileEditing = true
        textField.floatingLabelYPadding = floatingLabelYPadding
        textField.textColor = .white
        textField.enablesReturnKeyAutomatically = true
        return textField
    }

    static var formManager: VLRFormService {
        return VLRFormService()
    }
}

extension VLRFormService {
    func addTextFields(_ textFields: [VLRTextField]) {
        for field in textFields {
            self.addTextField(field)
        }
    }
}
