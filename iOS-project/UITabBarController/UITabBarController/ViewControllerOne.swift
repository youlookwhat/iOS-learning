//
//  ViewControllerOne.swift
//  UITabBarController
//
//  Created by 景彬 on 2022/4/4.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewControllerOne: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarItem.title = "首页"
        self.view.backgroundColor = UIColor.red
        
        let image = UIImage(named: "home")
        var cs =  image?.size
        cs?.height = 20
        cs?.width = 20
        self.tabBarItem.image = image?.withRenderingMode(.alwaysOriginal)
        self.tabBarItem.selectedImage = UIImage(named: "home_selected")?.withRenderingMode(.alwaysOriginal)
        
        
        let button = UIButton(frame: CGRect(x: 20, y: 100, width: 100, height: 40))
        button.setTitle("弹出警告窗", for: .normal)
        button.addTarget(self, action: #selector(tip), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button)
        
        
        let button2 = UIButton(frame: CGRect(x: 20, y: 200, width: 100, height: 40))
       button2.setTitle("弹出登录窗", for: .normal)
       button2.addTarget(self, action: #selector(login), for: UIControl.Event.touchUpInside)
       self.view.addSubview(button2)
    

        let button3 = UIButton(frame: CGRect(x: 20, y: 300, width: 200, height: 40))
        button3.setTitle("我是按钮抽屉", for: .normal)
        button3.addTarget(self, action: #selector(popSheet), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button3)
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func popSheet(){
        let sheet = UIAlertController(title: "我是抽屉弹框", message: "这里是内容", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "确定", style: .default){
            action in
            print("点击了")
        }
        let action2 = UIAlertAction(title: "取消", style: .cancel){
            action in
            print("取消")
        }
        sheet.addAction(action)
        sheet.addAction(action2)
        self.present(sheet, animated: true, completion: nil)
    }
    
    @objc func login(){
        let alert = UIAlertController(title: "登录框", message: "我是登录框", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "登录", style: .default){
            (action) in
            print(alert.textFields?.first?.text ?? "未输入文字")
        }
        let action2 = UIAlertAction(title: "取消", style: .default,handler: nil)
        alert.addTextField{ (textField) in
            textField.placeholder = "请输入用户名"
        }
        alert.addTextField{ (textField) in
            textField.placeholder = "请输入密码"
            textField.isSecureTextEntry = true
        }
        alert.addAction(action1)
        alert.addAction(action2)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func tip(){
        
        let c = UIAlertController(title: "我是警告弹框", message: "填写的内容", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "确定", style: .default){
            action in
            print("点击了")
        }
        let action2 = UIAlertAction(title: "取消", style: .cancel){
            action in
            print("取消")
        }
        let action3 = UIAlertAction(title: "删除", style: .default){
            action in
            print("删除")
        }
        c.addAction(action)
        c.addAction(action3)
        c.addAction(action2)
        self.present(c, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
