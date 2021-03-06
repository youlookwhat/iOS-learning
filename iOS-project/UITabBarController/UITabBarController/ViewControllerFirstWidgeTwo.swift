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
class ViewControllerFirstWidgeTwo: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

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
        studyUIDatePicker()
        studyUISearchBar()
        
        
        // Do any additional setup after loading the view.
    }
    
    /*
     * 搜索栏控件
     */
    func studyUISearchBar(){
       let searchBar = UISearchBar(frame: CGRect(x: 20, y: 200, width: 354, height: 80))
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        // 光标颜色
        searchBar.tintColor = UIColor.red
        // 将背景设置为图片
//        serachBar.backgroundImage
        searchBar.placeholder = "请输入内容"
        // 标题
        searchBar.prompt = "标题"
        // 取消按钮
        searchBar.showsCancelButton = true
        // 书库按钮
        searchBar.showsBookmarkButton = true
        // 搜索结果下拉按钮
//        serachBar.showsSearchResultsButton = true
        // 设置图标 search搜索按钮，clear清除按钮，bookmark书库按钮，resultList搜索结果按钮
        searchBar.setImage(UIImage(named: "image"), for: .search, state: .normal)
        
        // 显示控件的附件视图
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["女鞋","男装","男鞋","女装"]
        searchBar.selectedScopeButtonIndex = 0
//        searchBar.frame = CGRect(x: 20, y: 250, width: 354, height: 30)
        
        
        searchBar.delegate = searchClass
        
        self.view.addSubview(searchBar)
    }
    // 需要为成员变量
    let searchClass = SearchController()
    class SearchController : ViewController, UISearchBarDelegate {
        func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
            print("点击了书库")
        }
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            print("点击了取消按钮")
        }
        func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            print("已经结束了编辑状态")
        }
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            print("搜索的文本发现变化时：\(searchText)")
        }
        func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
            print(selectedScope)
//            print("搜索的标签被点击：\(selectedScope)")
        }
    }
    
    
    /*
     * 时间选择器控件
     */
    func studyUIDatePicker(){
        let dp = UIDatePicker(frame: CGRect(x: 20, y: 480, width: 354, height: 200))
        // countDownTimer 计时模式； date 日期模式
        dp.datePickerMode = UIDatePicker.Mode.dateAndTime
        dp.addTarget(self, action: #selector(pickerFunc), for: UIControl.Event.valueChanged)
        self.view.addSubview(dp)
    }
    
    @objc func pickerFunc(datePicker:UIDatePicker){
        let date = datePicker.date
        let time = datePicker.countDownDuration
        print(date,time)
    }
    
    
    
    /*
     * 选择器控件
     */
    func studyUIPickerView(){
        let pview = UIPickerView(frame: CGRect(x: 20, y: 270, width: 354, height: 200))
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
