//
//  PageTitleView.swift
//  WDYZB
//
//  Created by vincentwen on 17/5/2.
//  Copyright © 2017年 vincentwen. All rights reserved.
//

import UIKit


class PageTitleView: UIView {

    //定义标题属性
    fileprivate var titles : [String]

    // MARK:- 自定义构造函数
    init(frame: CGRect,titles:[String]) {
        
        self.titles = titles
        
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
