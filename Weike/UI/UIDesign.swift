//
//  UIDesign.swift
//  Weike
//
//  Created by Weiyu Zhou on 7/24/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

class UIDesign: NSObject {
    private static var design: UIDesign?

    static var sharedUIDesign: UIDesign {
        get { return design == nil ? UIDesign() : design! }
        set { design = newValue }
    }
    
    override init() {
        super.init()
    }

    // MARK - Color
    func backgroundColor() -> UIColor {
        return UIColor.white()
    }

    // MARK - Font


    // MARK - Icon

}
