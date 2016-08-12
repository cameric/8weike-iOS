//
//  UIImage+Utils.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/8/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

extension UIImage {
    static func fromColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            assertionFailure()
            return UIImage()
        }
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        guard let img = UIGraphicsGetImageFromCurrentImageContext() else {
            assertionFailure()
            return UIImage()
        }
        UIGraphicsEndImageContext()
        return img
    }
}
