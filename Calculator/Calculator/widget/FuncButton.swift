//
//  FuncButton.swift
//  Calculator
//
//  Created by 景彬 on 2022/4/21.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

// 单个按钮
class FuncButton: UIButton {

    init() {
        // 要使用自动布局，这里的 frame 设置为(0,0,0,0)
        super.init(frame:CGRect.zero)
        // 边框
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1).cgColor
        self.setTitleColor(UIColor.orange, for: UIControl.State.normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        // 按下的颜色
        self.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
