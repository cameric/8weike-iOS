//
//  UIFont+Utils.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/11/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

extension UIFont {
    // MARK: Fonts

    static var small: UIFont {
        return UIFont.systemFont(ofSize: 9)
    }

    static var normal: UIFont {
        return UIFont.systemFont(ofSize: 13)
    }

    static var large: UIFont {
        return UIFont.systemFont(ofSize: 17)
    }

    static var extraLarge: UIFont {
        return UIFont.systemFont(ofSize: 19)
    }

    static var extraExtraLarge: UIFont {
        return UIFont.systemFont(ofSize: 21)
    }

    static var smallBold: UIFont {
        return UIFont.boldSystemFont(ofSize: 9)
    }

    static var normalBold: UIFont {
        return UIFont.boldSystemFont(ofSize: 13)
    }

    static var largeBold: UIFont {
        return UIFont.boldSystemFont(ofSize: 17)
    }

    static var extraLargeBold: UIFont {
        return UIFont.boldSystemFont(ofSize: 19)
    }

    static var extraExtraLargeBold: UIFont {
        return UIFont.boldSystemFont(ofSize: 21)
    }
}
