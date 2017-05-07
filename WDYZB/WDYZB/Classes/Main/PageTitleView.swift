//
//  PageContentView.swift
//  WDYZB
//
//  Created by vincentwen on 17/5/5.
//  Copyright © 2017年 vincentwen. All rights reserved.
//

import UIKit

// MARK:- 定义代理，让内部的选择的lable Index变化告诉给外部
protocol PageTitleViewDelegate : class {
    func pageTitleView(_ titleView : PageTitleView, selectedIndex index : Int)
}

// MARK:- 定义常量
private let kScrollLineH : CGFloat = 2
private let kNormalColor : (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
private let kSelectColor : (CGFloat, CGFloat, CGFloat) = (255, 128, 0)

// MARK:- 定义PageTitleView类
class PageTitleView: UIView {
    
    // MARK:- 定义属性
    fileprivate var currentIndex : Int = 0
    fileprivate var titles : [String]
    weak var delegate : PageTitleViewDelegate?
    
    // MARK:- 懒加载属性
    fileprivate lazy var titleLabels : [UILabel] = [UILabel]()
    
    fileprivate lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    fileprivate lazy var scrollLine : UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    // MARK:- 自定义构造函数
    init(frame: CGRect, titles : [String]) {
        self.titles = titles
        
        super.init(frame: frame)
        
        // 设置UI界面
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK:- 设置UI界面
extension PageTitleView {
    fileprivate func setupUI() {
        // 1.添加UIScrollView
        addSubview(scrollView)
        
        scrollView.frame = bounds
        
        // 2.添加title对应的Label
        setupTitleLabels()
        
        // 3.设置底线和滚动的滑块
        setupBottomLineAndScrollLine()
    }
    
    fileprivate func setupTitleLabels() {
        
        // 0.确定label的一些frame的值
        
        let labelW : CGFloat = frame.width / CGFloat(titles.count)
        let labelH : CGFloat = frame.height - kScrollLineH
        let labelY : CGFloat = 0
        
        for (index, title) in titles.enumerated() {
            // 1.创建UILabel
            let label = UILabel()
            
            // 2.设置Label的属性
            label.text = title
            label.tag = index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor.darkGray
            label.textAlignment = .center
            
            // 3.设置label的frame
            let labelX : CGFloat = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            // 4.将label添加到scrollView中
            scrollView.addSubview(label)
            titleLabels.append(label)
            
            //5.监听lable的点击事件，通过设置手势来实现
            //将可以交互的属性设置为True，默认lable是不可用交互
            label.isUserInteractionEnabled = true
            //定义点击交互事件
            let TapGes = UITapGestureRecognizer(target: self, action: #selector(self.titleLableClick(_:))  )
            label.addGestureRecognizer(TapGes)
            
            

        }
    }
    
    fileprivate func setupBottomLineAndScrollLine() {
        // 1.添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        let lineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(bottomLine)
        
        // 2.添加scrollLine
        // 2.1.获取第一个Label
        guard let firstLabel = titleLabels.first else { return }
        firstLabel.textColor = UIColor.orange

        
        // 2.2.设置scrollLine的属性
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height - kScrollLineH, width: firstLabel.frame.width, height: kScrollLineH)
    }
}

// MARK: lable的颜色切换和lable的下划线的滚动
extension PageTitleView{
    
    @objc fileprivate func titleLableClick(_ tapGes : UITapGestureRecognizer){
        
        //1.获取当前的下标值,如果没有值就直接返回
        guard let currentLable = tapGes.view as? UILabel else { return }
        
        //2.获取之前的lable下标值
        let oldLable = titleLabels[currentIndex]
        
        //3.切换lable的颜色
        currentLable.textColor = UIColor.orange
        oldLable.textColor = UIColor.darkGray
        
        //4.保存最新的lable下标
        currentIndex = currentLable.tag
        
        //5.滚动条的位置发生变化,计算x轴的移动宽度
        let scrollLineX = CGFloat(currentIndex) * scrollLine.frame.width
        //设置移动动画
        UIView.animate(withDuration: 0.15, animations:{
            self.scrollLine.frame.origin.x = scrollLineX
        })
        
        //6.通知代理
        delegate?.pageTitleView(self, selectedIndex: currentIndex)
        
    }
}

// MARK： 将内部lable的index变化暴露给外部的函数

extension PageTitleView{
    func setTitleWithProgress(_ progress : CGFloat, sourceIndex : Int, targetIndex : Int)  {
         
    
    }
}





