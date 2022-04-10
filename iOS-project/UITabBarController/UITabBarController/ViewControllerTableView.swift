//
//  ViewControllerHistory.swift
//  UITabBarController
//
//  Created by 景彬 on 2022/4/5.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewControllerTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var dataArray:Array<String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        studyUITableView()
    }
    
    func studyUITableView(){
        
        dataArray = ["第一行","第二行","第三行","第四行","第五行"]
        
        // plain 单行列表，grouped 分组列表
        let tableView = UITableView(frame: self.view.frame,style: .grouped)
        tableView.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "TableViewCellId")
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // 设置列表多少行
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray!.count
    }
    
    // 设置每行数据的数据载体cell视图
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 根据注册的cell类id值获取载体cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath)
        cell.textLabel?.text = dataArray?[indexPath.row]
        return cell
    }
    
    // 如果是grouped，这是列表的分区数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    // 系统自己的分区头部ui设置
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "我是分区头部"
    }
    
    // 系统自己的分区尾部ui设置
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "我是分区尾部"
    }
    
    // 设置自定义的分区头部ui
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 120))
        view.backgroundColor = UIColor.red
        return view
    }
    
    // 设置自定义的分区尾部ui
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 150))
        view.backgroundColor = UIColor.blue
        return view
    }
    
    // 设置自定义分区头部的高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    // 设置自定义分区尾部的高度
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 150
    }
    
}
