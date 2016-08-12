//
//  UIButton+Utils.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/11/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

extension UIButton {
    static func whiteBorderTransparent() -> UIButton {
        let button = UIButton(type: .system)
        
        button.layer.borderWidth = length(fromPixel: 1.0)
        button.layer.cornerRadius = length(fromPixel: 10.0)
        button.layer.borderColor = UIColor.white().cgColor
        
        button.setTitleColor(UIColor.white(), for: [])
        button.tintColor = UIColor.black()

        return button
    }
}
