//
//  ViewControllerTwo.swift
//  UIControllerProject
//
//  Created by 景彬 on 2022/4/3.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewControllerPresentTwo: UIViewController {

    // 一种是直接赋值，一种是通过更构造方法
    public var data : String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        let button = UIButton(frame: CGRect(x: 20, y: 130, width: 80, height: 40))
        button.backgroundColor = UIColor.black
        button.setTitle("返回", for: .normal)
        button.addTarget(self, action: #selector(back), for:UIControl.Event.touchUpInside)
        self.view.addSubview(button)
        
        let label = UILabel(frame: CGRect(x: 20, y: 200, width: 200, height: 40))
        label.text = data
        self.view.addSubview(label)
        
    }
    
    var closure:((String)->Void)?
    
    @objc func back(){
        // 1、通过协议返回传值
        detegate?.sentData(s: "我是回传过去的值")
        // 2、通过闭包传值
        self.closure!("我是回传过去的值2")
        dismiss(animated: true, completion: nil)
    }
    
    init(){
       super.init(nibName: nil, bundle: nil)
    }
    init(data:String) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    var detegate:ViewControllerTwoProtocal? = nil
    
}
protocol ViewControllerTwoProtocal {
    func sentData(s:String)
}
