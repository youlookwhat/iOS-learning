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
class ViewControllerTwo: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // 加载中框
    private var aiv : UIActivityIndicatorView? = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        setPageStyle()
        
        
        studyUISilder()
        studyUIActivityIndicatorView()
        studyUIProgressView()
        studyUIStepper()
        studyUIPickerView()
        
        
        // Do any additional setup after loading the view.
    }
    
    /*
     * 选择器控件
     */
    func studyUIPickerView(){
        let pview = UIPickerView(frame: CGRect(x: 20, y: 200, width: 354, height: 200))
        // 代理
        pview.delegate = self
        // 数据源
        pview.dataSource = self
        
        // 重新加载某个分组
//        pview.reloadComponent(1)
        // 重新加载全部分组
//        pview.reloadAllComponents()
        
        self.view.addSubview(pview)
    }
    
    // 分组数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    // 每组的行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    // 创建标题：设置数据的位置
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "第\(component+1)组，第\(row+1)行"
    }
    // 对显示文本属性自定义
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attr = NSMutableAttributedString(string: "第\(component+1)组，第\(row+1)行")
        attr.addAttributes([NSMutableAttributedString.Key.foregroundColor:UIColor.red], range: NSRange(location: 0, length: attr.length))
        return attr
    }
    // 设置为图片
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let image = UIImage(named: "image")
//        let imageview = UIImageView(image: image)
//        imageview.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
//        return imageview
//    }
    // 选择的位置
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("用户选择了第\(component+1)列，第\(row+1)行")
    }
    // 设置组的宽度
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component==0 {
            return 200
        } else {
            return 150
        }
    }
    // 设置组的高度
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
//       if component==0 {
            return 40
//        } else {
//            return 20
//        }
    }
    
    /*
     * 步进器控件
     */
    func studyUIStepper(){
        let stepper = UIStepper(frame: CGRect(x: 20, y: 150, width: 0, height: 0))
        stepper.tintColor = UIColor.red
        stepper.maximumValue = 10
        stepper.minimumValue = 0
        stepper.stepValue = 1
        stepper.wraps = false
        stepper.addTarget(self, action: #selector(stepperFunc), for: UIControl.Event.valueChanged)
        self.view.addSubview(stepper)
    }
    
    @objc func stepperFunc(stepper: UIStepper){
        print("Stepper：\(stepper.value)")
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
