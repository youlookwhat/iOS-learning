//
//  WaterFallLayout.swift
//  UITabBarController
//
//  Created by 景彬 on 2022/4/12.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

// 瀑布流布局
class WaterFallLayout: UICollectionViewFlowLayout {

    var itemCount :Int = 0
    var attributeArray:Array<UICollectionViewLayoutAttributes>?
    
    required init?(coder: NSCoder) {
        itemCount = 0
        super.init(coder: coder)
    }
    init(itemCount:Int){
        self.itemCount = itemCount
        super.init()
    }
    override func prepare() {
        super.prepare()
        self.scrollDirection = .vertical
        attributeArray = Array<UICollectionViewLayoutAttributes>()
        let WIDTH = (UIScreen.main.bounds.size.width - self.minimumInteritemSpacing)/2
        var queueHeight:(one:Int,two:Int) = (0,0)
        for index in 0..<self.itemCount{
            let indexPath = IndexPath(item: index, section: 0)
            let artts = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            let  height = Int(arc4random()%150+40)
            var queue = 0
            if queueHeight.one <= queueHeight.two{
                queueHeight.one += (height+Int(self.minimumInteritemSpacing))
                queue = 0
            } else {
                queueHeight.two  += (height+Int(self.minimumInteritemSpacing))
                queue = 1
            }
            // 符号左右要有空格
            let tmpH = (queue == 0) ? (queueHeight.one - height) : (queueHeight.two-height)
            artts.frame = CGRect(x: (self.minimumInteritemSpacing+WIDTH)*CGFloat(queue), y: CGFloat(tmpH), width: WIDTH, height: CGFloat(height))
            attributeArray?.append(artts)
        }
        
        // 高度计算
        if queueHeight.one <= queueHeight.two {
            self.itemSize = CGSize(width: WIDTH, height: CGFloat(queueHeight.two*2/self.itemCount) - self.minimumInteritemSpacing)
        } else {
            self.itemSize = CGSize(width: WIDTH, height: CGFloat(queueHeight.one*2/self.itemCount) - self.minimumInteritemSpacing)
        }
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributeArray
    }
    
}
