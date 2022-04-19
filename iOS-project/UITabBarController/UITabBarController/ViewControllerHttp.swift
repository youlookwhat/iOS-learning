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
        // 本地存储
        studyNSHomeDiretory()
        // 本地存储自定义数据（常用）
        studyNSCoding()
    }
    
    func studyNSCoding(){
        let dic = NSHomeDirectory()
        let fileName = dic + "archive.file"
        var peopleImp = People()
        peopleImp.age = 18
        peopleImp.name = "jingbin"
        // 归档
        NSKeyedArchiver.archiveRootObject(peopleImp, toFile: fileName)
        
        // 解归档
        let getPeople = NSKeyedUnarchiver.unarchiveObject(withFile: fileName) as! People
        print("--姓名：\(getPeople.name)，“年龄：\(getPeople.age)”")
        print()
    }
    
    
    //----------------------------------------------------
    
    // 本地存储，指定文件和值，可以直接存储字符串等
    func studyNSHomeDiretory(){
        let homeDic = NSHomeDirectory()
        let filePath = homeDic + "archiver.file"
        NSKeyedArchiver.archiveRootObject("jing_NSHomeDirectory", toFile: filePath)
    }
    
    func getNSHomeDirectory(){
        let homeDic = NSHomeDirectory()
        let filePath = homeDic + "archiver.file"
        let name = NSKeyedUnarchiver.unarchiveObject(withFile: filePath)
        print(name)
    }
    
    //----------------------------------------------------
    
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
    
    //----------------------------------------------------
    
    // 新建 NewPlist 文件，可以有很直观的观察。只能读取，用来存固定的数据。相当于安卓的 asset
    func studyNewPlist(){
        // 获取文件路径
        let  path = Bundle.main.path(forResource: "NewPlist", ofType: "plist")
        // 将文件内容读成字典
        let dic = NSDictionary(contentsOfFile: path!)
        print(dic ?? "dic 为 nil")
        
    }
    
    //----------------------------------------------------
    
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
        getNSHomeDirectory()
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

// NSCoding 协议
class People : NSObject , NSCoding{
    
    var name:String? = nil
    var age:NSInteger = 0
    
    override init() {
        super.init()
    }
    // 归档方法
    func encode(with coder: NSCoder) {
        coder.encode(age,forKey: "age")
        coder.encode(name,forKey: "name")
    }
    
    // 解归档方法
    required init?(coder: NSCoder) {
        super.init()
        self.name = coder.decodeObject(forKey: "name") as! String?;
        self.age = coder.decodeInteger(forKey: "age")
    }
}
