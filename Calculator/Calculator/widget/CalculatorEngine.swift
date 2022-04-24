//
//  CalculatorEngine.swift
//  Calculator
//
//  Created by 景彬 on 2022/4/24.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

// 计算工具类
class CalculatorEngine: NSObject {
    let funcArray :CharacterSet = ["+","-","*","/","^","%"]
    func calculatEquation(equation:String) -> Double {
        // 以运算符进行分隔，获取所有的数字
        let elementArray = equation.components(separatedBy: funcArray)
        var tip = 0
        // 运算结果
        var result : Double = Double(elementArray[0])!
        
        for char in equation {
            switch char {
            case "+":
                tip += 1
                if elementArray.count>tip {
                    result += Double(elementArray[tip])!
                }
                break
            case "-":
                tip += 1
                if elementArray.count>tip {
                    result -= Double(elementArray[tip])!
                }
            break
            case "*":
                tip += 1
                if elementArray.count>tip {
                    result *= Double(elementArray[tip])!
                }
            break
            case "/":
                tip += 1
                if elementArray.count>tip {
                    result /= Double(elementArray[tip])!
                }
            break
            case "%":
                tip += 1
                if elementArray.count>tip {
                    result = Double(Int(result)%Int(elementArray[tip])!)
                }
            break
            case "^":
                tip += 1
                if elementArray.count>tip {
                    let tmp = result
                    for _ in 1..<Int(elementArray[tip])! {
                        result *= tmp
                    }
                }
            break
            default:
                break
            }
        }
        
        return result
    }
}
