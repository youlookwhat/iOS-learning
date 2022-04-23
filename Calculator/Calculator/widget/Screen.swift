//
//  Screen.swift
//  Calculator
//
//  Created by 景彬 on 2022/4/23.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

// 显示屏
class Screen: UIView {

    // 用于显示用户输入信息
    var inputLable:UILabel?
    // 用于显示历史记录信息
    var historyLable:UILabel?
    
    // 用户输入表达式或者计算结果字符串
    var inputString = ""
    // 历史表达式字符串
    var historyString = ""
    
    // 所有数字字符，用与进行检测匹配
    let figureArray:Array<Character> = ["0","1","2","3","4","5","6","7","8","9","."]
    // 所有运算功能字符
    let funcArray = ["+","-","*","/","%","^"]
    
    init() {
        inputLable = UILabel()
        historyLable = UILabel()
        super.init(frame: .zero)
        installUI()
    }
    
    func installUI() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
