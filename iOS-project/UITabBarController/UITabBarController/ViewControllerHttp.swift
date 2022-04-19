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

        
        // get请求
        studyHttp()
        // sp
        studyUserDefault()
        // asset
        studyNewPlist()
        // 创建plist文件
        studyPlistFile()
    }
    
    func studyPlistFile(){
        // 获取沙盒的用户数据目录
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        // 拼上文件名
        let fileName = path! + "/NewPlist2.plist"
        let dic:NSDictionary = ["name":"jaki","age":"29"]
        // 进行写文件
        dic.write(toFile: fileName, atomically: true)
        
        // 读取
        let dicRes = NSDictionary(contentsOfFile: fileName)
        print(dicRes ?? "dicRes为nil")
    }
    
    // 新建 NewPlist 文件，可以有很直观的观察。只能读取，用来存固定的数据。相当于安卓的 asset
    func studyNewPlist(){
        // 获取文件路径
        let  path = Bundle.main.path(forResource: "NewPlist", ofType: "plist")
        // 将文件内容读成字典
        let dic = NSDictionary(contentsOfFile: path!)
        print(dic ?? "dic 为 nil")
        
    }
    
    // 键值对存储，就像安卓的 sp
    func studyUserDefault(){
        let userDefaults = UserDefaults.standard
        userDefaults.set(URL(string: "http://jinbeen.com"),forKey: "urlKey")
        userDefaults.set("jingbin", forKey: "stringKey")
        // 同步
        userDefaults.synchronize()
    }
    
    
    func getUserDefaults(){
        let userDefaults = UserDefaults.standard
        print(userDefaults.string(forKey: "stringKey"))
        print(userDefaults.url(forKey: "urlKey")?.absoluteString)
    }
    
    
    // 每次回到这个页面会调用，从后台返回不会
    override func viewWillAppear(_ animated: Bool) {
        getUserDefaults()
    }
    
    //------------------------------------------------
    
    func studyHttp(){
        let config = URLSessionConfiguration.default
        let date = "2022-04-18"
        let url = URL(string: String(format:
            "https://apiv3.shanbay.com/weapps/dailyquote/quote?date=%@", date))
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
