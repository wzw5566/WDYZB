//
//  RecommendViewModel.swift
//  WDYZB
//
//  Created by vincentwen on 17/5/19.
//  Copyright © 2017年 vincentwen. All rights reserved.
//

import UIKit

class RecommendViewModel {
    
    

}

// MARK:发送网络请求
extension RecommendViewModel{
    
    func requestData(){
        
        //1.请求推荐数据
        
        //2.请求颜值数据
        
        //3.请求后面部分数据
        NetworkTools.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate",parameters: ["limit" : "4","offset" : "0", "time" : NSDate.getCurrentTime()]) { (result) in
            print(result)
        }
    }
}
