//
//  UIViewUtils.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/2/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

func disableTranslatesAutoresizingMaskIntoConstraints(_ views: [String: UIView]) {
    for view in views.values {
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIView {
    func addSubviews(_ views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
}
