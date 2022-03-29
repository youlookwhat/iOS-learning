//
//  ViewController.swift
//  FirstProject
//
//  Created by 景彬 on 2022/3/27.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        studyUILable()
        studyUIButton()
        studyUIImageview()
        studyUITextField()
    }
    
    /*
    * 文本输入框控件 UITextField
    */
    func studyUITextField(){
        let uiTextField = UITextField(frame: CGRect(x: 30, y: 580, width: 200, height: 30))
        // 输入框边框风格 roundedRect圆角边框 line直线边框
        uiTextField.borderStyle = UITextField.BorderStyle.roundedRect
        uiTextField.textColor = UIColor.red
        uiTextField.textAlignment = NSTextAlignment.center
        uiTextField.placeholder = "请输入姓名"
        
        // 设置左右视图
        let imageView = UIImageView(image: UIImage(named: "image"))
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        let imageView2 = UIImageView(image: UIImage(named: "image"))
        imageView2.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        uiTextField.leftView = imageView
        uiTextField.rightView = imageView2
        uiTextField.leftViewMode = UITextField.ViewMode.always
        // whileEditing编辑状态才显示
        uiTextField.rightViewMode = UITextField.ViewMode.never
        // 清除按钮
        uiTextField.clearButtonMode = UITextField.ViewMode.always
        
        
        uiTextField.delegate = self
        
        self.view.addSubview(uiTextField)
    }
    
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        return true
//    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
//    // 已经编辑时调用
//     func textFieldDidBeginEditing(_ textField: UITextField) {
//        print(textField.text ?? 0)
//    }
//     func textFieldDidEndEditing(_ textField: UITextField) {
//        print("结束")
//    }
    
    
    /*
     * 图片显示控件 UIImageview
     */
    func studyUIImageview(){
        // 图片素材创建实例
        let image = UIImage(named: "app_loading0")
        // 以路径创建
//        UIImage(contentsOfFile: "filePath")
        // 以data数据创建
//        UIImage(data: Data())
        let size = image?.size
        print(size)// Optional((20.0, 20.0))
        
        // 创建显示控件
        let uiimageview = UIImageView(image: image)
        uiimageview.frame = CGRect(x: 30, y: 520, width: 40, height: 40)
        
        self.view.addSubview(uiimageview)
        
        
        // 创建动态播放图 帧动画
        var imageArray = Array<UIImage>()
        for index in 0...3 {
            let image = UIImage(named: "app_loading\(index)")
            imageArray.append(image!)
        }
        let gifImageView = UIImageView(frame: CGRect(x: 130, y: 520, width: 40, height: 40))
        gifImageView.animationImages = imageArray
        // 动画播放时长
        gifImageView.animationDuration = 1
        // 0表示无线播放
        gifImageView.animationRepeatCount = 0
        self.view.addSubview(gifImageView)
        gifImageView.startAnimating()
        
    }

   /*
    * 按钮控件 UIButton
    */
    func studyUIButton() {
        // detailDisclosure 详情 有图标
        let uiButton = UIButton(type: UIButton.ButtonType.system)
        // 计算高度是一个麻烦事
        uiButton.frame = CGRect(x: 20, y: 400, width: 100, height: 100)
        uiButton.backgroundColor = UIColor.blue
        uiButton.setTitle("标题", for: .normal)
        uiButton.setTitleColor(UIColor.white, for: .normal)
//        uiButton.setTitleColor(UIColor.blue, for: .selected)
        // 添加点击事件 touchUpInside按下了并在按钮范围内抬起
        uiButton.addTarget(self, action: #selector(touchBegin), for: UIControl.Event.touchUpInside)
        // 图片在文字左边
        uiButton.setImage(UIImage(named: "image"), for: .normal)
        // 图片背景
        uiButton.setBackgroundImage(UIImage(named: "image"), for: .normal)
        // 设置标题文字的位置偏移
        uiButton.titleEdgeInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 20)
        // 设置图片文字的位置偏移
        uiButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 30, right: 0)
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

