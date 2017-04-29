//
//  HomeViewController.swift
//  WDYZB
//
//  Created by vincentwen on 17/4/28.
//  Copyright © 2017年 vincentwen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置UI界面
        setupUI()
        
    

    }

}

//设置UI界面
extension HomeViewController{
    
    fileprivate func setupUI(){
        
        //调用设置导航栏方法
        setupNavigationBar()
    
    }
    
    
    //1.设置导航栏fileprivate新的访问控制
    fileprivate func  setupNavigationBar(){
        
        let btn = UIButton()
        btn.setImage(UIImage(named:"logo"), for: .normal)
        btn.sizeToFit()
    
        //设置左边的icon
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
        //设置按钮历史记录小iocn设置普通效果和高亮显示效果,并设置高度不然无法显示
        let size = CGSize(width: 40, height: 40)
        
        let historyBtn = UIButton()
        historyBtn.setImage(UIImage(named:"image_my_history"), for:.normal)
        historyBtn.setImage(UIImage(named:"Image_my_history_click"), for: .highlighted)
        historyBtn.frame = CGRect(origin:CGPoint.zero, size: size)

        //将按钮转化成UIBarButtonItem类型
        let historyItem = UIBarButtonItem(customView:historyBtn)

        
        //设置搜索晓icon，并设置普通效果和高亮效果
        let searchBtn = UIButton()
        searchBtn.setImage(UIImage(named:"btn_search"),for:.normal)
        searchBtn.setImage(UIImage(named:"btn_search_clicked"), for: .highlighted)
        searchBtn.frame = CGRect(origin:CGPoint.zero, size: size)
        let searchItem = UIBarButtonItem(customView:searchBtn)

        
        
        //设置扫描icon图标并设置普通效果和高亮效果
        let qrCodeBtn = UIButton()
        qrCodeBtn.setImage(UIImage(named:"Image_scan"), for:.normal)
        qrCodeBtn.setImage(UIImage(named:"Image_scan_click"), for: .highlighted)
        qrCodeBtn.frame = CGRect(origin:CGPoint.zero, size: size)

        let qrCodeItem = UIBarButtonItem(customView:qrCodeBtn)
        
        //rightBarButtonItems存放一个数组
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrCodeItem]
        
    
    }
    
}
