//
//  UIFont+Utils.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/11/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

extension UIFont {
    // MARK: Fonts
    
    static func small() -> UIFont {
        return UIFont.systemFont(ofSize: 9)
    }
    
    static func normal() -> UIFont {
        return UIFont.systemFont(ofSize: 13)
    }
    
    static func large() -> UIFont {
        return UIFont.systemFont(ofSize: 17)
    }
    
    static func smallBold() -> UIFont {
        return UIFont.boldSystemFont(ofSize: 9)
    }
    
    static func normalBold() -> UIFont {
        return UIFont.boldSystemFont(ofSize: 13)
    }
    
    static func largeBold() -> UIFont {
        return UIFont.boldSystemFont(ofSize: 17)
    }
}
