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
        return .systemFont(ofSize: 9)
    }

    static var normal: UIFont {
        return .systemFont(ofSize: 13)
    }

    static var large: UIFont {
        return .systemFont(ofSize: 17)
    }

    static var extraLarge: UIFont {
        return .systemFont(ofSize: 21)
    }

    static var extraExtraLarge: UIFont {
        return .systemFont(ofSize: 25)
    }

    static var smallBold: UIFont {
        return .boldSystemFont(ofSize: 9)
    }

    static var normalBold: UIFont {
        return .boldSystemFont(ofSize: 13)
    }

    static var largeBold: UIFont {
        return .boldSystemFont(ofSize: 17)
    }

    static var extraLargeBold: UIFont {
        return .boldSystemFont(ofSize: 21)
    }

    static var extraExtraLargeBold: UIFont {
        return .boldSystemFont(ofSize: 25)
    }
}
