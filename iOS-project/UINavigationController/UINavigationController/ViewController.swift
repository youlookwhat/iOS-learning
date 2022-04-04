//
//  ViewController.swift
//  UINavigationController
//
//  Created by 景彬 on 2022/4/4.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black
        self.title = "第2个视图控制器"
        
        
        let item = UIBarButtonItem(title: "pop", style: .plain, target: self, action: #selector(back))
        self.navigationItem.rightBarButtonItem = item
        
        // Do any additional setup after loading the view.
    }
    
    @objc func back(){
        // 返回 和导航栏自带的返回一样
        _ = self.navigationController?.popViewController(animated: true)
        
        // 返回指定的ViewController，会将上面的所有ViewController都弹出，像安卓的singleTask
//        self.navigationController?.popToViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
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
