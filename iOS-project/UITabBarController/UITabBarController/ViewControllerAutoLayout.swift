//
//  ViewControllerAutoLayout.swift
//  UITabBarController
//
//  Created by 景彬 on 2022/4/18.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewControllerAutoLayout: UIViewController , UITextViewDelegate{

    var textView:UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        studyNSLayoutConstraint()
        studyVFL()
        
        studySnp()
        studyUITextView()
    }
    
    // 输入框 随着内容变多高度变化
    func studyUITextView(){
        textView = UITextView()
        textView?.layer.borderWidth = 2
        textView?.layer.borderColor = UIColor.gray.cgColor
        textView?.delegate = self
        self.view.addSubview(textView!)
        textView?.snp.makeConstraints({(make) in
            make.leading.equalTo(100)
            make.trailing.equalTo(-100)
            make.top.equalTo(150)
            make.height.equalTo(30)
        })
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView.bounds.size.height >= 100 {
            if textView.contentSize.height < textView.bounds.size.height {
                textView.snp.updateConstraints({(reMake) in
                    reMake.height.equalTo(textView.contentSize.height)
                })
            }
        }
        if (textView.contentSize.height != textView.bounds.size.height)&&textView.bounds.size.height<100 {
            textView.snp.updateConstraints({(reMake) in
                reMake.height.equalTo(textView.contentSize.height)
            })
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
        return true
    }
    
    
    func studySnp(){
      let view = UIView()
        view.backgroundColor = UIColor.purple
        self.view.addSubview(view)
        // 使用 SnapKit 添加约束  updateConstraints 更新  removeConstraints移除
        view.snp.makeConstraints() { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(580)
            make.bottom.equalTo(-120)
//            make.left.top.equalTo(20)
        }
    }
    
    
    func studyVFL(){
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.green
        self.view.addSubview(view)
        
        // h 表示水平方向的约束(左右间距为60) v竖直反向的约束(距上面是100) 200约束视图的高度
        let stringH = "H:|-60-[view]-60-|"
        let stringV = "V:|-100-[view(200)]|"
        let h = NSLayoutConstraint.constraints(withVisualFormat: stringH, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["view":view])
        
        let v = NSLayoutConstraint.constraints(withVisualFormat: stringV, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["view":view])
        self.view.addConstraints(h)
        self.view.addConstraints(v)
    }
    
    
    func studyNSLayoutConstraint(){
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        self.view.addSubview(view)
        
        // item 要添加约束的视图控件
        // attribute 约束的属性
        // relatedBy 约束的方式
        // toItem 约束参照的另一个视图控件
        // attribute 约束的属性
        // multiplier 要进行约束的比例
        // constant 约束值
        let layoutCons = NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let layoutCons2 = NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
        let layoutCons3 = NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
        
        let layoutCons4 = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
        self.view.addConstraints([layoutCons,layoutCons2,layoutCons3,layoutCons4])
    }
    


}
