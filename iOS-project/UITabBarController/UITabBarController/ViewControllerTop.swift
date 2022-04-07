//
//  ViewControllerTop.swift
//  UITabBarController
//
//  Created by 景彬 on 2022/4/5.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewControllerTop: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarItem.title = "滚动视图"
        self.view.backgroundColor = UIColor.white
        
        let sc = UIScrollView(frame: self.view.frame)
        self.view.addSubview(sc)
        
        // 左右滑动的视图
        let view1 = UIView(frame: self.view.frame)
        view1.backgroundColor =  UIColor.red
        let view2 = UIView(frame: CGRect(x: self.view.frame.size.width, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        view2.backgroundColor =  UIColor.black
        sc.addSubview(view1)
        sc.addSubview(view2)
        // 另外设置实际的位置与尺寸
        sc.contentSize = CGSize(width: self.view.frame.size.width*2, height: self.view.frame.size.height)
    }
    


}
