//
//  RecommendViewController.swift
//  WDYZB
//
//  Created by vincentwen on 17/5/7.
//  Copyright © 2017年 vincentwen. All rights reserved.
//

import UIKit

//定义item之间的间距
private let kItemMargin : CGFloat = 10
private let kHeaderViewH : CGFloat = 50

private let kNormalCellID = "kNormalCellID"
private let kHeaderViewID = "kHeaderViewID"

let kPrettyCellID = "kPrettyCellID"
let kItemW = (kScreenW - 3 * kItemMargin) / 2
let kNormalItemH = kItemW * 3 / 4
let kPrettyItemH = kItemW * 4 / 3


class RecommendViewController: UIViewController {

    //MARK: 懒加载Recommend的ViewModel
   fileprivate lazy var recommendVM: RecommendViewModel = RecommendViewModel()
    
    //MARK:定义属性
    fileprivate lazy var collectionView : UICollectionView = {[ unowned self] in
        
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kItemW, height: kNormalItemH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = kItemMargin
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: kItemMargin, bottom: 0, right: kItemMargin)
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderViewH)

        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        //高宽跟随父控件
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kNormalCellID)
        

        
        collectionView.register(UINib(nibName: "CollectionHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kHeaderViewID)
        
        //注册cell
        collectionView.register(UINib(nibName: "CollectionPrettyCell", bundle: nil), forCellWithReuseIdentifier: kPrettyCellID)
        
        //注册cell
        collectionView.register(UINib(nibName: "CollectionNormalCell", bundle: nil), forCellWithReuseIdentifier: kNormalCellID)
        
        return collectionView
   
        
        
    }()
    
    //MARK: 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

    }

}

// MARK: 设置UI内容
extension RecommendViewController{
    
    fileprivate func setupUI(){
        
        view.addSubview(collectionView)
        
        
    }
    
}

//MARK: - 请求数据
extension RecommendViewController{
    
   private  func loadData() {
        
    NetworkTools.requestData(.post, URLString: "http://httpbin.org/post", parameters: ["name" : "vincent"]) { (result) in
            print(result)
        }
  
    }
}



//遵循CollectionView的数据源协议
extension RecommendViewController :UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    //分组，返回多少组数据
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 12 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 8
        }
        
        return 4
        
    }func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //定义cell
        var cell : UICollectionViewCell!
        
        if  indexPath.section == 1 {
            
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPrettyCellID, for: indexPath)
        }
        else{
            
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: kNormalCellID, for: indexPath)
        }
        

        return cell
    }
    
    
    //头
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        //1.取出headerView
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kHeaderViewID, for: indexPath)
        
        return headerView
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            
            return CGSize(width: kItemW, height: kPrettyItemH)
        }
        
        return CGSize(width: kItemW, height: kNormalItemH)
        
    }
    
    
    
}
