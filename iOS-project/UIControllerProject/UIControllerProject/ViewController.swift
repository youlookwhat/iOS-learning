//
//  ViewController.swift
//  UIControllerProject
//
//  Created by 景彬 on 2022/4/3.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /*
     *依次执行：
     *loadView
     *viewDidLoad
     *viewWillAppear
     *viewDidAppear
     */
    // 加载视图时
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    // 视图加载完成时调用的方法
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad")
        
        self.view.backgroundColor = UIColor.red
        
        let button = UIButton(frame: CGRect(x: 20, y: 130, width: 80, height: 40))
        button.backgroundColor = UIColor.black
        button.setTitle("跳转", for: .normal)
        button.addTarget(self, action: #selector(jump), for:UIControl.Event.touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func jump(){
        // 2、构造方法传值
        let vct = ViewControllerTwo(data: "这是传过来的数据")
        // 1、直接赋值
//        vct.data = "这是传过来的数据";
        self.present(vct, animated: true, completion: nil)
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
}

