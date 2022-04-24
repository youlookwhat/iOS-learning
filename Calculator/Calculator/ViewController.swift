//
//  ViewController.swift
//  Calculator
//
//  Created by 景彬 on 2022/4/21.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BoardButtonInputDelegate {

    var board:Board!
    var screen:Screen!
    let callulator = CalculatorEngine()
    var isNew = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 测试
        let b = FuncButton()
        b.frame = CGRect(x: 20, y: 20, width: 200, height: 200)
        b.setTitle("sdfs", for: .normal)
        
        installUI()
         
    }

    func installUI(){
        board = Board()
        board.delegate = self
        self.view.addSubview(board)
        board.snp.makeConstraints({(maker) in
            maker.left.right.bottom.equalTo(0)
            maker.height.equalTo(board.superview!.snp.height).multipliedBy(2/3.0)
       })
        
        screen = Screen()
        self.view.addSubview(screen)
        screen.snp.makeConstraints({(maker) in
            maker.left.right.top.equalTo(0)
            maker.bottom.equalTo(board.snp.top)
        })
    }

    func boardButtonClick(content: String) {
        if content == "AC" || content == "Delete" || content == "=" {
            switch content {
            case "AC":
                screen.clearContent()
                screen.refreshHistory()
            case "Delete":
                screen.deleteInput()
                break
            case "=":
                let result = callulator.calculatEquation(equation: screen.inputString)
                screen.refreshHistory()
                screen.clearContent()
                // 将结果输入
                screen.inputContent(content: String(result))
                isNew = true
                break
            default:
                screen.refreshHistory()
            }
        } else {
            if isNew {
                screen.clearContent()
                isNew = false
            }
            screen.inputContent(content: content)
        }
    }
}

