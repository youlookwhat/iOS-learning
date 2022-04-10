//
//  ViewControllerTwo.swift
//  UITabBarController
//
//  Created by 景彬 on 2022/4/4.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarItem.title = "推荐"
        self.view.backgroundColor = UIColor.blue
        // Do any additional setup after loading the view.
        
        let item = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        self.tabBarItem = item
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
