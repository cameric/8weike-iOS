//
//  UI.swift
//  Weike
//
//  Created by Weiyu Zhou on 7/24/16.
//  Copyright © 2016 Cameric. All rights reserved.
//

enum UITheme {
  case None
  case Holiday
}

class UI: NSObject {
  let theme: UITheme
  static var sharedUI = UI()
  
  override convenience init() {
    self.init(withTheme: .None)
  }
  
  init(withTheme theme: UITheme) {
    self.theme = theme
    super.init()
    UI.sharedUI = self
  }
  
}
