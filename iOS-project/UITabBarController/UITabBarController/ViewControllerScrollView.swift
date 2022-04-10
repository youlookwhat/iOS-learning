//
//  ViewControllerTop.swift
//  UITabBarController
//
//  Created by 景彬 on 2022/4/5.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewControllerScrollView: UIViewController,UIScrollViewDelegate {

    
    var   image:UIImageView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.tabBarItem.title = "滚动视图"
        self.view.backgroundColor = UIColor.white
        
        
        // 滚动视图
        let sc = UIScrollView(frame: self.view.frame)
        self.view.addSubview(sc)
        
        // 左右滑动的视图
        let view1 = UIView(frame: self.view.frame)
        view1.backgroundColor =  UIColor.red
        let view2 = UIView(frame: CGRect(x: self.view.frame.size.width, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        view2.backgroundColor =  UIColor.black
//        sc.addSubview(view1)
//        sc.addSubview(view2)
        // 另外设置实际的位置与尺寸
//        sc.contentSize = CGSize(width: self.view.frame.size.width*2, height: self.view.frame.size.height)
        // 开启竖直方向的回弹效果
        sc.alwaysBounceVertical = true
        // 是否显示滚动条
        sc.showsVerticalScrollIndicator = false
        
        // 开启自动定位分页效果，轮播图使用
        sc.isPagingEnabled = true
        
        sc.delegate = self
        
        // 缩放操作
        image = UIImageView(image: UIImage(named: "home"))
        image!.frame = self.view.frame
        sc.addSubview(image!)
        sc.contentSize = self.view.frame.size
        
        sc.minimumZoomScale = 0.5
        sc.maximumZoomScale = 2
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image!
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("当滚动视图滚动时被系统自动调用")
    }
    


}
