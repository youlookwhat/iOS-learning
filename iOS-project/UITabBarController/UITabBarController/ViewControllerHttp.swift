//
//  ViewControllerHttp.swift
//  UITabBarController
//
//  Created by 景彬 on 2022/4/18.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewControllerHttp: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let config = URLSessionConfiguration.default
        let url = URL(string: String(format: "https://apiv3.shanbay.com/weapps/dailyquote/quote", "abc"))
        var request = URLRequest(url: url!)
//        request.httpMethod = "POST"
//        request.httpBody = "需要传递的参数字符串".data(using: .utf8)
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request){(data,request,error) in
            let dic = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
            print(dic ?? "未解析到数据")
        }
        task.resume()
    }
    


}
