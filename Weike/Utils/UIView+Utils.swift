//
//  UIView+Utils.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/2/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

/// This method is usually called prior to configuring constraints
func disableTranslatesAutoresizingMaskIntoConstraints(_ views: [String: UIView]) {
    for view in views.values {
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}

func disableTranslatesAutoresizingMaskIntoConstraints(_ views: [UIView]) {
    for view in views {
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIView {
    /// Add a list of subviews
    func addSubviews(_ views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
}

/// This is for checking whether the keyboard will show or hide
/// Call startListenToKeyboardEvent to start listening
@objc protocol KeyboardDelegate: class {
    @objc func keyboardWillShow(_ notification: NSNotification)
    @objc func keyboardWillHide(_ notification: NSNotification)
}

extension KeyboardDelegate {
    func startListenToKeyboardEvent() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }
    func stopListenToKeyboardEvent() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
}
