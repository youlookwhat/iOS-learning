//
//  ViewController.swift
//  FirstProject
//
//  Created by 景彬 on 2022/3/27.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        studyUILable()
        studyUIButton()
    }

   /*
    * 按钮控件 UIButton
    */
    func studyUIButton() {
        // detailDisclosure 详情 有图标
        let uiButton = UIButton(type: UIButton.ButtonType.system)
        // 计算高度是一个麻烦事
        uiButton.frame = CGRect(x: 20, y: 400, width: 100, height: 30)
        uiButton.backgroundColor = UIColor.purple
        uiButton.setTitle("标题", for: .normal)
        uiButton.setTitleColor(UIColor.white, for: .normal)
//        uiButton.setTitleColor(UIColor.blue, for: .selected)
        // 添加点击事件 touchUpInside按下了并在按钮范围内抬起
        uiButton.addTarget(self, action: #selector(touchBegin), for: UIControl.Event.touchUpInside)
        uiButton.setImage(UIImage(named: "beian"), for: .normal)
        self.view.addSubview(uiButton)
    }
    
    @objc func touchBegin(){
        print("点击并抬起")
    }

    

    /*
     * 便签控件 UILable
     */
    func studyUILable(){
       // 1.创建 UILable 控件
        let lable = UILabel(frame: CGRect(x: 20, y: 120, width: 200, height: 30))
        lable.text = "我是一个普通的便签控件"
        self.view.addSubview(lable)
        
        // 2.多样式
        let lable2 = UILabel(frame: CGRect(x: 20, y: 140, width: 200, height: 30))
        lable2.text = "我是一个自定义的便签控件"
        // 20 加粗
        lable2.font = UIFont.boldSystemFont(ofSize: 20)
        lable2.textColor = UIColor.red
        lable2.shadowColor = UIColor.green
        // 阴影偏移
        lable2.shadowOffset = CGSize(width: 2, height: 2)
        // 文字对齐模式
        lable2.textAlignment = NSTextAlignment.center
        self.view.addSubview(lable2)
        
        // 3.多行
        let lable3 = UILabel(frame: CGRect(x: 20, y: 160, width: 200, height: 150))
        // 对多5行，同时也受height的限制
        lable3.numberOfLines = 5
        lable3.text = "我是很多文本我是很多文本我是很多文本我是很多文本我是很多文本我是很多文本我是很多文本我是很多文本我是很多文本我是很多文本我是很多文本我是很多文本我是很多文本"
        self.view.addSubview(lable3)
        
        // 4.多样式(富文本)
        let lable4 = UILabel(frame: CGRect(x: 20, y: 300, width: 200, height: 150))
        let attri = NSMutableAttributedString(string: "我是个性化文本")
        // 对0，1位置的文本进行20号加粗和设置字体红色
        attri.addAttributes([NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20),NSMutableAttributedString.Key.foregroundColor:UIColor.red], range: NSRange(location: 0, length: 2))
        // 对3，4，5位置的文本进行13号字体的设置，和设置字体蓝色
        attri.addAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor:UIColor.blue], range: NSRange(location: 3, length: 3))
        lable4.attributedText = attri
        self.view.addSubview(lable4)
    }
}

