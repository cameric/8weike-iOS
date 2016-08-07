//
//  UITheme.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/2/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

enum UIThemeType {
    case none
    case holiday
}

class UITheme: NSObject {
    static func design(forThemeType themeType: UIThemeType) -> UIDesign {
        switch themeType {
            case .none:
                return UIDesign()
            case .holiday:
                return HolidayTheme()
        }
    }
}
