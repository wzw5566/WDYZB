//
//  MainViewController.swift
//  WDYZB
//
//  Created by vincentwen on 17/4/28.
//  Copyright © 2017年 vincentwen. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildVc(storyName: "Home")
        addChildVc(storyName: "Live")
        addChildVc(storyName: "Follow")
        addChildVc(storyName: "Profile")
       
    }
    
    
    //抽象一个添加Storyboard的方法
    private func addChildVc(storyName:String)
    {
        
        //1.通过StoryBoard获取控制器,!解包
        let childVc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        //将childVc作为子控制器
        addChildViewController(childVc)
    }


}
