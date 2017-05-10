//
//  NetworkTools.swift
//  WDYZB
//
//  Created by vincentwen on 17/5/11.
//  Copyright © 2017年 vincentwen. All rights reserved.
//

import UIKit
import Alamofire

//枚举请求方法
enum MethodType {
    //
    case get
    case post
}

class NetworkTools {
    

    //封装请求方法，传入，请求方式，url，参数，回调方法
    class func requestData(_ type: MethodType, URLString: String, parameters: [String : Any]? = nil, finishedCallback: @escaping (_  result : Any) -> ()) {
        
        //1.定义请求范式
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        //2.发送请求，并且将请求到的数据回调
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            
            //3.获取结果，guard 验证结果，不正确打印错误，返回
            guard let result = response.result.value else{
                print(response.result.error)
                return
            }
            
            //4.将结构回调回去
            finishedCallback(response)

        
       
        
    }

}
}
