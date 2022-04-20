//
//  ViewControllerNavigation.swift
//  UITabBarController
//
//  Created by 景彬 on 2022/4/20.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewControllerNavigation: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        // 导航栏的左按钮，相当于安卓的标题栏
        self.navigationController?.navigationBar.barTintColor=UIColor.red
        // reply 返回，done 完成。 bookmarks 书库。这里有很多的风格
        let leftItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(click))
        self.navigationItem.leftBarButtonItem = leftItem
        
        let rightItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        self.navigationItem.rightBarButtonItem = rightItem
        
        
        print("viewDidLoad")
    }
    
    // 添加新的页面
    @objc func add(){
        let vc = ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        // present 是改在上面
    }
    
    
    @objc func click(){
        print("点了左按钮")
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


}
