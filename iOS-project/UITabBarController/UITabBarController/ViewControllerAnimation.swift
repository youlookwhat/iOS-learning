//
//  ViewControllerAnimation.swift
//  UITabBarController
//
//  Created by 景彬 on 2022/4/13.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewControllerAnimation: UIViewController {

    var animationView:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        studyAnimal()
    }
    
    func studyAnimal(){
        animationView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        animationView?.backgroundColor = UIColor.red
        self.view.addSubview(animationView!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        changeColor1s()
//        changeColor1sFinish()
//        changeColor1sDelay()
        
        changeColor1sSpring()
    }
    
    func changeColor1sSpring(){
       // usingSpringWithDamping 阻尼系数 1表示无回弹效果 initialSpringVelocity初始速度
        UIView.animate(withDuration: 1, delay: 0,usingSpringWithDamping: 0.5,initialSpringVelocity: 0.5 , options: [], animations: {
            self.animationView?.center = CGPoint(x: 150, y: 350)
        }, completion: nil)
    }
    
    func changeColor1sDelay(){
        UIView.animate(withDuration: 1,delay: 2,options: [UIView.AnimationOptions.repeat] ,animations: {
            // 在1秒内由红色变为蓝色
            self.animationView?.backgroundColor = UIColor.blue
        },completion: nil)
    }
    
    func changeColor1sFinish(){
        UIView.animate(withDuration: 1, animations: {
            // 在1秒内由红色变为蓝色
            self.animationView?.backgroundColor = UIColor.blue
        }) {
            // 结束后再执行其他行为
            (finish) in
            UIView.animate(withDuration: 2, animations: {
                self.animationView?.center = CGPoint(x: 150, y: 300)
            })
        }
    }
    
    func changeColor1s(){
        UIView.animate(withDuration: 1, animations: {
            // 在1秒内由红色变为蓝色
            self.animationView?.backgroundColor = UIColor.blue
        })
    }
    
    
    
    override func viewDidDisappear(_ animated: Bool) {
//        animationView = nil
        print("viewDidDisappear\(animated)")
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
