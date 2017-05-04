//
//  UIColor-Extension.swift
//  WDYZB
//
//  Created by vincentwen on 17/5/5.
//  Copyright © 2017年 vincentwen. All rights reserved.
//


import UIKit

//自定义构造函数，来修改调用颜色的方法
extension UIColor {
    convenience init(r : CGFloat, g : CGFloat, b : CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
    
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
}

