//
//  UIScreen+Utils.swift
//  Weike
//
//  Created by Weiyu Zhou on 8/11/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

func length(fromPixel pixel: CGFloat) -> CGFloat {
    return pixel / UIScreen.main.scale
}
