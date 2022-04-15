//
//  ViewControllerCALayer.swift
//  UITabBarController
//
//  Created by 景彬 on 2022/4/15.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

// Core 核心动画技术
class ViewControllerCALayer: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        studyCAGradientLayer()
        studyCAReplicatorLayer()
        studyCAShapeLayer()
        
    }
    
    // 3.自定义图形形状，倒三角形 CAShapeLayer
    func studyCAShapeLayer(){
        let shapeLayout = CAShapeLayer()
        shapeLayout.position = CGPoint.zero
        // 创建图形路径
        let path = CGMutablePath()
        // 起始点
        path.move(to: CGPoint(x: 30, y: 300))
        // 画线
        path.addLine(to: CGPoint(x: 230, y: 300))
        // 可将400改为200就成了正三角
        path.addLine(to: CGPoint(x: 130, y: 400))
        path.addLine(to: CGPoint(x: 30, y: 300))
        shapeLayout.path = path
        // 图形边缘线条起点
        shapeLayout.strokeStart = 0
        shapeLayout.strokeEnd = 1
        // 设置填充
        shapeLayout.fillRule = CAShapeLayerFillRule.evenOdd
        shapeLayout.fillColor = UIColor.red.cgColor
        // 边缘线
        shapeLayout.strokeColor = UIColor.red.cgColor
        shapeLayout.lineWidth = 1
        self.view.layer.addSublayer(shapeLayout)
    }
    
    // 2.创建拷贝图层 CAReplicatorLayer
    func studyCAReplicatorLayer(){
        let replicator = CAReplicatorLayer()
        replicator.position = CGPoint.zero
        // 创建内容图层
        let subLayer = CALayer()
        subLayer.bounds = CGRect(x: 0, y: 0, width: 20, height: 20)
        // 第一个内容的x,y坐标
        subLayer.position = CGPoint(x: 30, y: 220)
        subLayer.backgroundColor = UIColor.red.cgColor
        replicator.addSublayer(subLayer)
        // 每次拷贝将副本沿x轴平移30个单位
        replicator.instanceTransform = CATransform3DMakeTranslation(30, 0, 0)
        // 拷贝副本的个数
        replicator.instanceCount = 10
        self.view.layer.addSublayer(replicator)
    }
    
    // 1.创建渐变色图层 CAGradientLayer
    func studyCAGradientLayer(){
        let gradientLayer =  CAGradientLayer()
        // 尺寸，基于 (0,0)点，它的宽高是100
        gradientLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        // 中心点位置
        gradientLayer.position = CGPoint(x: 100, y: 150)
        // 渐变的颜色
        gradientLayer.colors = [UIColor.red.cgColor,UIColor.green.cgColor,UIColor.blue.cgColor]
        // 从0.2到0.5是渐变，0.5到0.7是渐变
        gradientLayer.locations = [NSNumber(value: 0.2),NSNumber(value: 0.5),NSNumber(value: 0.8)]
        
        // 渐变的起始点和结束点，点是最左边的中心和最右边的中心
//        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
//        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        // 左上角和右下角
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        self.view.layer.addSublayer(gradientLayer)
    }
    


}
