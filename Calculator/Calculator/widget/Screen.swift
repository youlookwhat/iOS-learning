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
    var inputLable:UILabel!
    // 用于显示历史记录信息
    var historyLable:UILabel!
    
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
//        inputLable.text = "dddddd"
        historyLable = UILabel()
//        historyLable.text = "dddddd"
        super.init(frame: .zero)
        installUI()
    }
    
    // 界面的设计
    func installUI() {
        inputLable?.textAlignment = .right
        historyLable?.textAlignment = .right
        // 设置字体
        inputLable?.font = UIFont.systemFont(ofSize: 34)
        historyLable?.font = UIFont.systemFont(ofSize: 30)
        inputLable.textColor = UIColor.orange
        historyLable.textColor = UIColor.black
        // 字体大小可以根据屏幕适配
        inputLable.adjustsFontSizeToFitWidth = true
        inputLable.minimumScaleFactor = 0.5
        historyLable.adjustsFontSizeToFitWidth = true
        historyLable.minimumScaleFactor = 0.5
        // 文字截断方式
        inputLable.lineBreakMode = .byTruncatingHead
        historyLable.lineBreakMode = .byTruncatingHead
        inputLable.numberOfLines = 0
        historyLable.numberOfLines = 0
        self.addSubview(inputLable)
        self.addSubview(historyLable)
        
        // 布局
        inputLable.snp.makeConstraints({(maker) in
            maker.left.equalTo(10)
            maker.right.equalTo(-10)
            maker.bottom.equalTo(-10)
            maker.height.equalTo(inputLable.superview!.snp.height).multipliedBy(0.5).offset(-10)
        })
        historyLable.snp.makeConstraints({(maker) in
            maker.left.equalTo(10)
            maker.right.equalTo(-10)
            maker.top.equalTo(10)
            maker.height.equalTo(inputLable.superview!.snp.height).multipliedBy(0.5).offset(-10)
        })
    }
    
    // 输入
    func inputContent(content:String){
        // 如果不是数字 和 不是运算符，不处理
        if !figureArray.contains(content.last!) && !funcArray.contains(content) {
            return
        }
        
        if inputString.count>0  {
            if figureArray.contains(inputString.last!) {
                // 输入的数字字符
                inputString.append(content)
                inputLable.text = inputString
            } else {
                if figureArray.contains(content.last!) {
                    inputString.append(content)
                    inputLable.text = inputString
                }
            }
        }else{
            // 只有数字可以作为首字符
            if figureArray.contains(content.last!){
                inputString.append(content)
                inputLable.text = inputString
            }
        }
    }
    
    // 提供一个刷新历史记录的方法
    func refreshHistory(){
        historyString = inputString
        historyLable.text = historyString
    }
    
    // 清空
    func clearContent(){
        inputString = ""
    }
    
    // delete键
    func deleteInput(){
        if inputString.count>0{
            // 删除当前输入的上一个字符
            inputString.remove(at: inputString.index(before: inputString.endIndex))
            inputLable.text = inputString
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
