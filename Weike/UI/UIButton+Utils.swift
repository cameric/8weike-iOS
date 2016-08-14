//
//  UIButton+Utils.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/11/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

extension UIButton {
    
    static func whiteBorderTransparent(withTitle title: String, accessoryImage image: UIImage? = nil) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: [])
        
        button.layer.borderWidth = length(fromPixel: 1.0)
        button.layer.cornerRadius = length(fromPixel: 10.0)
        button.layer.borderColor = UIColor.white.cgColor
        
        button.setTitleColor(UIColor.white, for: [])
        button.backgroundColor = UIColor(white: 0, alpha: 0.4)
        
        guard let accessoryImage = image else {
            return button
        }

        button.setImage(accessoryImage, for: [])
        button.tintColor = UIColor.white
        
        return button
    }
}
