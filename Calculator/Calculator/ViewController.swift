//
//  ViewController.swift
//  Calculator
//
//  Created by 景彬 on 2022/4/21.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 测试
        let b = FuncButton()
        b.frame = CGRect(x: 20, y: 20, width: 200, height: 200)
        b.setTitle("sdfs", for: .normal)
        
        self.view.addSubview(b)
        
    }


}

