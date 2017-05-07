//
//  PageContentView.swift
//  WDYZB
//
//  Created by vincentwen on 17/5/5.
//  Copyright © 2017年 vincentwen. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {
    // MARK:- 懒加载属性
    fileprivate lazy var pageTitleView : PageTitleView = {[weak self] in
        let titleFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐", "游戏", "娱乐", "趣玩"]
        let titleView = PageTitleView(frame: titleFrame, titles: titles)
        titleView.delegate = self
        return titleView
        }()
    
    //懒加载，闭包定义pageContentView，防止循环引用，使用[weak self] in 标记为弱引用
    fileprivate lazy var pageContentView : PageContentView = {[weak self] in
        

        //确定frame的高度
        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH - kTabbarH
        
        //定义frame
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)
        
        var chilVcs = [UIViewController]()
        
        chilVcs.append(RecommendViewController())
        
        //循环创建子控制器
        for _ in 0..<3{
            
            let vc = UIViewController()
            
            //调用随机函数，设置背景颜色
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            chilVcs.append(vc)
        }
        
        //调用自定义构造函数,父控制器传入自身
        
        let contentView = PageContentView(frame: contentFrame, chilVcs: chilVcs, parentViewController: self!)
        contentView.delegate = self
        return contentView
        
        
        return contentView
    }()
    
    
    
       
    // MARK:- 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置UI界面
        setupUI()
    }
    
}


// MARK:- 设置UI界面
extension HomeViewController {
    fileprivate func setupUI() {
        // 0.不需要调整UIScrollView的内边距
        automaticallyAdjustsScrollViewInsets = false
        
        // 1.设置导航栏
        setupNavigationBar()
        
        // 2.添加TitleView
        view.addSubview(pageTitleView)
        
        //3.添加ContenView
        view.addSubview(pageContentView)
        pageContentView.backgroundColor = UIColor.blue
        


    }
    
    fileprivate func setupNavigationBar() {
        // 1.设置左侧的Item
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        // 2.设置右侧的Item
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
    }
}

// MARK ： 遵守PageTitleView的代理协议
extension HomeViewController:PageTitleViewDelegate{
    
    //实现协议的方法，将pagetitleview中的选中的lable的下标，传给pageContentView的下标
    func pageTitleView(_ titleView: PageTitleView, selectedIndex index: Int) {
          pageContentView.setCurrentIndex(index)
    }
}

extension HomeViewController : PageContentViewDelegate{
    
    func pageContentView(_ contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
         pageTitleView.setTitleWithProgress(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}



