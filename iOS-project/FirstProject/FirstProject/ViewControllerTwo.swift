//
//  ViewControllerTwo.swift
//  FirstProject
//
//  Created by 景彬 on 2022/3/30.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

/*
 * 第14章 UI控件与逻辑交互
 */
class ViewControllerTwo: UIViewController {

    private var aiv : UIActivityIndicatorView? = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        setPageStyle()
        
        
        studyUISilder()
        studyUIActivityIndicatorView()
        studyUIProgressView()
        
        
        // Do any additional setup after loading the view.
    }
    
    /*
    * 进度条控件
    */
    func studyUIProgressView(){
        let pv = UIProgressView(frame: CGRect(x: 20, y: 130, width: 280, height: 10))
        pv.progressTintColor = UIColor.red
//        pv.progressImage = UIImage(named: "image")
        // 未走过的颜色
        pv.trackTintColor = UIColor.gray
        pv.setProgress(0.5, animated: true)
        self.view.addSubview(pv)
    }
    
    /*
     * 活动指示器 加载中的loading
     */
    func studyUIActivityIndicatorView(){
        // 首先设置风格
         aiv = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
        aiv?.color = UIColor.red
        // 位置
        aiv?.center = self.view.center
        aiv?.startAnimating()
        self.view.addSubview(aiv!)
    }
    
    /*
     * 滑块控件  相当于安卓的seek
     */
    func studyUISilder(){
        let slider = UISlider(frame: CGRect(x: 20, y: 80, width: 280, height: 30))
        slider.maximumValue = 10
        slider.minimumValue = 0
        slider.value = 5
        // 左进度条颜色
        slider.minimumTrackTintColor = UIColor.red
        slider.maximumTrackTintColor = UIColor.green
        slider.backgroundColor = UIColor.white
        // 指示器的图标
        slider.setThumbImage(UIImage(named: "image"), for: .normal)
//        slider.setMinimumTrackImage(UIImage(named: "app_loading0"), for: .normal)
//        slider.setMaximumTrackImage(UIImage(named: "app_loading1"), for: .normal)
        
        slider.addTarget(self, action: #selector(sliderFunc), for: UIControl.Event.valueChanged)
        
        // 是否可滑动
        slider.isContinuous = true
        self.view.addSubview(slider)
    }
    
    @objc func sliderFunc(slide:UISlider){
        print(slide.value)
    }
    
    func setPageStyle(){
        // 还是要先设置样式
        let bt = UIButton(type: UIButton.ButtonType.system)
        bt.frame = CGRect(x: 30, y: 30, width: 100, height: 40)
        bt.setTitle("返回", for: .normal)
        bt.backgroundColor = UIColor.red
        bt.addTarget(self, action: #selector(back), for: UIControl.Event.touchUpInside)
        self.view.addSubview(bt)
    }
    
    @objc func back(){
        self.dismiss(animated: true, completion: nil)
        // 停止转圈
        aiv?.stopAnimating()
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
