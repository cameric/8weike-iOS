//
//  UIDesign.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/2/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

enum UITheme {
    case none
    case holiday
}

class UIDesign: NSObject {
    
    // MARK: Icons
    static func logo() -> UIImage {
        let image = UIImage(named: "logo")
        return image == nil ? self.defaultImage() : image!
    }
    
    // MARK: Third Party
    static func wechatLogo() -> UIImage {
        let image = UIImage(named: "wechat")
        return image == nil ? self.defaultImage() : image!
    }
    
    static func defaultImage() -> UIImage {
        return UIImage()
    }
}
