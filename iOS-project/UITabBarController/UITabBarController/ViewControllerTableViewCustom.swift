//
//  ViewControllerTableViewCustom.swift
//  UITabBarController
//
//  Created by 景彬 on 2022/4/10.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewControllerTableViewCustom: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    var dataArray:Array<ProductBean>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // TableView自定义cell
        let pro1 = ProductBean()
        pro1.imageName = "home"
        pro1.name = "杜康"
        pro1.subTitle = "何以解忧"
        pro1.price = "58元"
        
        let pro2 = ProductBean()
        pro2.imageName = "home"
        pro2.name = "杜康2"
        pro2.subTitle = "何以解忧"
        pro2.price = "58元"
        dataArray = [pro1,pro2]
        
        let tableview = UITableView(frame: self.view.frame,style: .plain)
        tableview.register(UINib.init(nibName: "TableViewProCell", bundle: nil), forCellReuseIdentifier: "TableViewCellId")
        self.view.addSubview(tableview)
        
        tableview.delegate = self
        tableview.dataSource = self
        
        // 编辑模式
        tableview.isEditing = true
    }

    // 设置个数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray!.count
       }
    
    // 设置高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return   153
    }
       
    // cell视图
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell : TableViewProCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellId", for: indexPath) as! TableViewProCell
    print(indexPath.row)
        let model = dataArray![indexPath.row]
        cell.proImageView.image =  UIImage(named: model.imageName!)
        cell.proTitle.text = model.name
        cell.proSubTitle.text = model.subTitle
        cell.proPrice.text = model.price
    
        return cell
   }
    
    // 返回每行的cell的编辑模式
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if  indexPath.row==0 {
            return .insert
        } else  {
            return .delete
        }
    }
    
    // 显示交互按钮的文字
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        if  indexPath.row==0 {
            return "插入"
        } else  {
            return "删除"
        }
    }
    
    // 点击交互按钮回调的方法
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle==UITableViewCell.EditingStyle.delete {
            print("点击了删除按钮")
            // 删除数据源
            dataArray!.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        } else {
            print("点击了插入按钮")
            let pro2 = ProductBean()
            pro2.imageName = "home"
            pro2.name = "杜康插入"
            pro2.subTitle = "何以解忧"
            pro2.price = "58元"
            dataArray?.insert(pro2, at: indexPath.row)
            tableView.insertRows(at: [indexPath], with: .fade)
        }
    }
    
    // 改，可以排序
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print("排序功能")
        let tmp = dataArray![sourceIndexPath.row]
        let tmp2 = dataArray![destinationIndexPath.row]
        dataArray![sourceIndexPath.row] = tmp2
        dataArray![destinationIndexPath.row] = tmp
    }
    
}

class ProductBean :NSObject {
    var name:String?
    var price:String?
    var imageName:String?
    var subTitle:String?
}
