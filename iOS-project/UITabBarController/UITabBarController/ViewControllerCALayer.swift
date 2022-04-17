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
        
        /*
         * CoreAnimation
         *      - CAAnimation
                    - CAPropertyAnimation 属性动画类
                        - CABaseAnimation 基础的属性过渡动画
                            - CASpringAnimation 弹簧效果的阻尼动画
                        - CAKeyframeAnimation 关键帧属性过渡动画
                    - CATransition 转场动画类
                    - CAAnimationGroup 组合动画类
         *
         */
//        studyCABaseAnimation();
//        studyCAKeyframeAnimation();
        studyCASpringAnimation();
        studyCATransition();
        studyCAAnimationGroup()
        
    }
    
    // 8.CAAnimationGroup 动画集合
    func studyCAAnimationGroup(){
        // 背景色过渡动画
        let basicAni = CABasicAnimation(keyPath: "backgroundColor")
        basicAni.toValue = UIColor.green.cgColor
        // 变型动画
        let basicAni2 = CABasicAnimation(keyPath: "transform.scale.x")
        basicAni.toValue = NSNumber(value: 2)
        // 动画集合
        let groupAni = CAAnimationGroup()
        groupAni.animations = [basicAni,basicAni2]
        groupAni.duration = 3
        let layer = CALayer()
        layer.position = CGPoint(x: 250, y: 750)
        layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        layer.add(groupAni, forKey: "")
        self.view.layer.addSublayer(layer)
    }
    
    // 7.CATransition layer出现时展示动画效果
    func studyCATransition(){
        let transAni = CATransition()
        // push 压入效果 fade 渐入效果 moveId 移入效果 reveal 溶解效果
        transAni.type = CATransitionType.push
        // fromTop 从上侧执行
        transAni.subtype = CATransitionSubtype.fromTop
        let layer = CALayer()
        layer.position = CGPoint(x: 100, y: 650)
        layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        layer.backgroundColor = UIColor.red.cgColor
        layer.add(transAni, forKey: "")
        self.view.layer.addSublayer(layer)
    }
    
    // 6.CASpringAnimation 阻尼动画
    func studyCASpringAnimation(){
        let animation = CASpringAnimation(keyPath: "position.y")
        // 模拟重物质量
        animation.mass = 2
        // 弹簧劲度系数 越大回弹越快
        animation.stiffness = 5
        // 阻尼系数 越大幅度越小
        animation.damping = 2
        // 中心点的纵坐标到600？
        animation.toValue = 600
        animation.duration = 4
        let layer = CALayer()
        layer.position = CGPoint(x: 100, y: 500)
        layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        layer.backgroundColor = UIColor.red.cgColor
        self.view.layer.addSublayer(layer)
        layer.add(animation, forKey: "")
    }
    
    // 5.CAKeyframeAnimation 可以设置多个过渡值
    func studyCAKeyframeAnimation(){
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        animation.values = [NSNumber(value: 0),NSNumber(value: Double.pi/4),NSNumber(value: 0),NSNumber(value: Double.pi)]
        animation.duration = 3
        self.view.layer.add(animation, forKey: "")
    }
    
    // 4.CABaseAnimation 基础的属性过渡动画，只能设置起始值和终止值
    func studyCABaseAnimation(){
        let basicAni = CABasicAnimation(keyPath: "transform.rotation.z")
        // 从0度开始旋转
        basicAni.fromValue = NSNumber(value: 0)
        // 旋转180度
        basicAni.toValue = NSNumber(value: Double.pi)
        basicAni.duration = 2
        self.view.layer.add(basicAni, forKey: nil)
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
