//
//  UIButton+Utils.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/11/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

extension UIButton {
    
    static func whiteBorderTransparent(withTitle title: String, accessoryImage image: UIImage? = nil) -> UIButton {
        let button = UIButton.rounded(withBackgroundColor: UIColor(white: 0, alpha: 0.4), withTitleColor: UIColor.white, withBorderColor: UIColor.white)
        button.setTitle(title, for: [])
        
        guard let accessoryImage = image else {
            return button
        }

        button.setImage(accessoryImage, for: [])
        button.tintColor = UIColor.white
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        
        return button
    }
    
    static var rounded: UIButton {
        return UIButton.rounded(withBackgroundColor: UIColor.main, withTitleColor: UIColor.white, withBorderColor: UIColor.main)
    }

    private static func rounded(withBackgroundColor backgroundColor: UIColor,
                        withTitleColor titleColor: UIColor,
                        withBorderColor borderColor: UIColor) -> UIButton {
        let button = UIButton(type: .system)

        button.layer.borderWidth = length(fromPixel: 1.0)
        button.layer.cornerRadius = length(fromPixel: 10.0)
        button.layer.borderColor = borderColor.cgColor
        
        button.setTitleColor(titleColor, for: [])
        button.backgroundColor = backgroundColor
        return button
    }
}
