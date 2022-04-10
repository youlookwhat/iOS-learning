//
//  ViewControllerTableViewIndex.swift
//  UITabBarController
//
//  Created by 景彬 on 2022/4/10.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewControllerTableViewIndex: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var dataArray : Array<String>?
    var titleArray:[String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataArray = Array<String>()
        for _ in 0...3{
            dataArray?.append("联系人")
        }
        titleArray = ["#","A","B","C","D","E","F","G","更多"]

        // plain 单行列表，grouped 分组列表
        let tableView = UITableView(frame: self.view.frame,style: .grouped)
        tableView.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "TableViewCellId")
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    // 设置列表的分区数
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleArray!.count
    }
    
    // 索引栏标题
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return titleArray!
    }
    
    // 分区头部标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleArray![section]
    }
    
    // 将索引栏的文字与具体的分区进行绑定
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray!.count
    }

// 设置每行数据的数据载体cell视图
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // 根据注册的cell类id值获取载体cell
       let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath)
       cell.textLabel?.text = dataArray?[indexPath.row]
       return cell
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
