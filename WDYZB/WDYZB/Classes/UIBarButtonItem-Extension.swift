//
//  File.swift
//  WDYZB
//
//  Created by vincentwen on 17/5/2.
//  Copyright © 2017年 vincentwen. All rights reserved.
//


import UIKit

extension UIBarButtonItem{
    convenience init(imageName:String, highImageName : String = "", size :CGSize = CGSize.zero) {
        //1.定义按钮
        let btn = UIButton()
        
        //2.设置按钮图片
        btn.setImage(UIImage(named: imageName), for: UIControlState())
        if highImageName != "" {
            btn.setImage(UIImage(named: highImageName), for: .highlighted)
        }
        
        
        //3.设置按钮的尺寸
        
        if size == CGSize.zero{
        
            btn.sizeToFit()
        }else{
        
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        
        }
        
        //4.创建UUIBarButtonItem
        self.init(customView : btn)
        
        
    }


}
