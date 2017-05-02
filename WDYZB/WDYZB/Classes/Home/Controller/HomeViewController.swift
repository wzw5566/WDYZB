//
//  HomeViewController.swift
//  WDYZB
//
//  Created by vincentwen on 17/4/28.
//  Copyright © 2017年 vincentwen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    // MARK:系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置UI界面
        setupUI()
        
    

    }

}

//设置UI界面
extension HomeViewController{
    
    // MARK:闭包创建pagetitleView
//    private lazy var pageTitleView : PageTitleView = {
//    
//        let titleFrame = CGRect(x: 0, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
//    
//    }()
    
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

        //let historyItem = UIBarButtonItem
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        
        //设置搜索晓icon，并设置普通效果和高亮效果
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        
        //设置扫描icon图标并设置普通效果和高亮效果
        let qrCodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
            
            //rightBarButtonItems存放一个数组
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrCodeItem]
        
    
    }
    
}
