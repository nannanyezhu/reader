//
//  UIColor+Extension.swift
//  coding-Swift
//
//  Created by 严楠楠 on 2018/6/22.
//  Copyright © 2018年 严楠楠. All rights reserved.
//

import UIKit


extension UIColor {
    convenience init(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        assert(alpha >= 0 && alpha <= 255, "Invalid alpha component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha) / 255.0)
    }
    
    
    convenience init(hexRgb rgb: Int) {
        self.init((rgb >> 16) & 0xFF, (rgb >> 8) & 0xFF, rgb & 0xFF, 1)
    }
    
    convenience init(hexRgba rgba: Int) {
        self.init((rgba >> 16) & 0xFF, (rgba >> 8) & 0xFF, rgba & 0xFF, (rgba >> 24) & 0xFF)
    }
    
    /// navigationbar title color
    class func navtigationTitleColor() -> UIColor {
        return UIColor.init(hexRgb: 0x323A45)
    }
}
