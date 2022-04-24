//
//  Board.swift
//  Calculator
//
//  Created by 景彬 on 2022/4/23.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

// 面板
class Board: UIView {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        initStallUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dataArray = ["0",".","%","="
        ,"1","2","3","+"
        ,"4","5","6","-"
        ,"7","8","9","*"
        ,"AC","Delete","^","/"
    ]
    
    var frontBtn:FuncButton!
    
    func initStallUI() {
        for index in 0..<20 {
            let bt = FuncButton()
            self.addSubview(bt)
            bt.snp.makeConstraints({ (maker) in
                // 每行的第一个，靠父视图左侧摆放
                if index%4 == 0 {
                    maker.left.equalTo(0)
                } else {
                    // 靠上一个按钮的右侧摆放
                    maker.left.equalTo(frontBtn.snp.right)
                }
                if index/4 == 0 {
                    // 第一行时，靠底部摆放
                    maker.bottom.equalTo(0)
                } else if index%4 == 0{
                    // 不是第一行且是每行的第一个。底部与上一个按钮的顶部对齐
                    maker.bottom.equalTo(frontBtn.snp.top)
                } else {
                    maker.bottom.equalTo(frontBtn.snp.bottom)
                }
                maker.width.equalTo(bt.superview!.snp.width).multipliedBy(0.25)
                maker.height.equalTo(bt.superview!.snp.height).multipliedBy(0.2)
            })
            bt.tag = index + 100
            bt.addTarget(self, action: #selector(btnClick(button:)), for: .touchUpInside)
            bt.setTitle(dataArray[index], for: UIControl.State.normal)
            frontBtn = bt
        }
    }
    
    @objc func btnClick(button:FuncButton){
        print(button.title(for: .normal))
        delegate?.boardButtonClick(content: button.currentTitle!)
    }

    var delegate : BoardButtonInputDelegate?
    
    
}

protocol BoardButtonInputDelegate {
    func boardButtonClick(content:String)
}
