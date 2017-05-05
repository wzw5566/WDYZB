//
//  PageContentView.swift
//  WDYZB
//
//  Created by vincentwen on 17/5/5.
//  Copyright © 2017年 vincentwen. All rights reserved.
//

import UIKit

private let ContentCellID = "ContentCellID"

class PageContentView: UIView {
    
    //定义chilVcs属性，存储传入的界面控制器数组
    fileprivate var chilVcs: [UIViewController]
    fileprivate var parentViewController: UIViewController
    
    //MARK:定义collectionView,懒加载
    fileprivate lazy var collectionView: UICollectionView = {[weak self] in
    
        //创建布局layout
        let layout = UICollectionViewFlowLayout()
        //父容器有多大，内容区域就有多大
        layout.itemSize = (self?.bounds.size)!
        //设置行间距
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        //滚动方向 水平方向
        layout.scrollDirection = .horizontal
        
        //2.创建UUICollectionView
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        //水平指示器
        collectionView.showsHorizontalScrollIndicator = false
        //不超出内容区域
        collectionView.bounces = false
        collectionView.scrollsToTop = false
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ContentCellID)
        return collectionView
    
    
    }()
    
    
 
    //自定义构造函数,传入界面控制器数组，父控制器
    init(frame: CGRect, chilVcs:[UIViewController], parentViewController:UIViewController) {
        
        self.chilVcs = chilVcs
        self.parentViewController = parentViewController
        
        super.init(frame:frame)
        
        //调用设置PageContentView UI
        setupUI()
        
        
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


// MARK: 设置UI界面

extension PageContentView{
    
    fileprivate func setupUI()
    {
        //1.将所有传入的子控制器添加到父控制器中

        for chilVc in chilVcs {
            parentViewController.addChildViewController(chilVc)
        }
        
        //2.真正布局contenView的内容,添加UICollectionView
        addSubview(collectionView)
        collectionView.frame = bounds
        
    
    }
    
}

// MARK:- 遵守UICollectionViewDataSource
extension PageContentView : UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return chilVcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // MARK: 创建Cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCellID, for: indexPath)
        
        for view in cell.contentView.subviews{
            
            view.removeFromSuperview()
        }
        
      //  let childVc = childVcs[(indexPath as NSIndexPath).item]
        let chilVc = chilVcs[(indexPath as NSIndexPath).item]

        chilVc.view.frame = cell.contentView.bounds
        
        cell.contentView.addSubview(chilVc.view)
        
        return cell
        
    }
    
}
