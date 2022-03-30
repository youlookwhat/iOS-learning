//
//  ViewControllerTwo.swift
//  FirstProject
//
//  Created by 景彬 on 2022/3/30.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

/*
 * 第14章 UI控件与逻辑交互
 */
class ViewControllerTwo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        setPageStyle()
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func setPageStyle(){
        // 还是要先设置样式
        let bt = UIButton(type: UIButton.ButtonType.system)
        bt.frame = CGRect(x: 30, y: 30, width: 100, height: 40)
        bt.setTitle("返回", for: .normal)
        bt.backgroundColor = UIColor.red
        bt.addTarget(self, action: #selector(back), for: UIControl.Event.touchUpInside)
        self.view.addSubview(bt)
    }
    
    @objc func back(){
        self.dismiss(animated: true, completion: nil)
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
