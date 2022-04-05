//
//  ViewControllerOne.swift
//  UITabBarController
//
//  Created by 景彬 on 2022/4/4.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewControllerOne: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarItem.title = "首页"
        self.view.backgroundColor = UIColor.red
        
        let image = UIImage(named: "home")
        var cs =  image?.size
        cs?.height = 20
        cs?.width = 20
        self.tabBarItem.image = image?.withRenderingMode(.alwaysOriginal)
        self.tabBarItem.selectedImage = UIImage(named: "home_selected")?.withRenderingMode(.alwaysOriginal)
        
        
        
        // Do any additional setup after loading the view.
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
