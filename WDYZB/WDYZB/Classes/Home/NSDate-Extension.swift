//
//  NSDate-Extension.swift
//  WDYZB
//
//  Created by vincentwen on 17/5/19.
//  Copyright © 2017年 vincentwen. All rights reserved.
//

import Foundation

//扩展当前时间
extension NSDate{
    
    //定义一个获取当前时间的方法，指定返回值的类型为String类型
    class func getCurrentTime() -> String{
        
        let nowDate = NSDate()
        
        //获取从1970到现在的时间间隔
        let interval = nowDate.timeIntervalSince1970
        
        return "\(interval)"
    
    }
    
}
