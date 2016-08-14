//
//  UIScreen+Utils.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/11/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

/// This method is for converting a length to actual pixel number shown on device
func length(fromPixel pixel: CGFloat) -> CGFloat {
    return pixel / UIScreen.main.scale
}
