//
//  ViewControllerOne.swift
//  UITabBarController
//
//  Created by 景彬 on 2022/4/4.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewControllerOne: UIViewController , ViewControllerTwoProtocal{

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarItem.title = "首页"
        self.view.backgroundColor = UIColor.red
        
        let image = UIImage(named: "home")
        
        self.tabBarItem.image = image?.withRenderingMode(.alwaysOriginal)
        self.tabBarItem.selectedImage = UIImage(named: "home_selected")?.withRenderingMode(.alwaysOriginal)
        
        
        studyPresent()
        studyNavigationBar()
        studyUIAlertController()
        
        // Do any additional setup after loading the view.
    }
    
    // 打开抽屉页
    func studyPresent(){
        let button = UIButton(frame: CGRect(x: 30, y: 130, width: 140, height: 40))
        button.backgroundColor = UIColor.black
        button.setTitle("跳转抽屉页", for: .normal)
        button.addTarget(self, action: #selector(jump), for:UIControl.Event.touchUpInside)
        self.view.addSubview(button)
        
        // 回显的文字
        label = UILabel(frame: CGRect(x: 20, y: 200, width: 200, height: 40))
        self.view.addSubview(label!)
    }
    
    @objc func jump(){
        // 2、构造方法传值
        let vct = ViewControllerPresentTwo(data: "这是传过来的数据")
        // 1、直接赋值
//        vct.data = "这是传过来的数据";
        
        // a.回传值 1种方式，通过回调
        vct.detegate = self
        // b.回传值 2种方式，对闭包进行赋值
        vct.closure = { (data:String) in
            self.label?.text = data
        }
        self.present(vct, animated: true, completion: nil)
    }
    
    var label:UILabel? = nil
    func sentData(s: String) {
        label?.text = s
        print("从上一个页面回传过来的值：\(s)")
    }
    
    // 界面将要显示时
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    // 界面已经显示时
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    // 视图将要消失时调用的地方
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }

    // 界面已经消失时调动的方法
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    // 内存收到警告时调用的方法
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // 析构方法
    deinit {
        print("deinit")
    }
    
    // ------- -------------------------------------------------
    
    func studyNavigationBar(){
        let button = UIButton(frame: CGRect(x: 200, y: 130, width: 140, height: 40))
        button.backgroundColor = UIColor.black
        button.setTitle("跳转二级页", for: .normal)
        button.addTarget(self, action: #selector(jumpNavigation), for:UIControl.Event.touchUpInside)
        self.view.addSubview(button)
        
        // 回显的文字
        label = UILabel(frame: CGRect(x: 20, y: 200, width: 200, height: 40))
        self.view.addSubview(label!)
    }
    
    // 添加新的页面
    @objc func jumpNavigation(){
        
        let vc = ViewControllerNavigation()
        self.navigationController?.pushViewController(vc, animated: true)
        // present 是改在上面
    }
    
    

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }
    
    // ------- -------------------------------------------------
    
    // 弹出框
    func studyUIAlertController(){
        let button = UIButton(frame: CGRect(x: 20, y: 250, width: 140, height: 40))
        button.setTitle("弹出警告窗", for: .normal)
        button.addTarget(self, action: #selector(tip), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button)
        
        
       let button2 = UIButton(frame: CGRect(x: 20, y: 300, width: 140, height: 40))
       button2.setTitle("弹出登录窗", for: .normal)
       button2.addTarget(self, action: #selector(login), for: UIControl.Event.touchUpInside)
       self.view.addSubview(button2)
    

        let button3 = UIButton(frame: CGRect(x: 20, y: 350, width: 140, height: 40))
        button3.setTitle("我是按钮抽屉", for: .normal)
        button3.addTarget(self, action: #selector(popSheet), for: UIControl.Event.touchUpInside)
        self.view.addSubview(button3)
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
