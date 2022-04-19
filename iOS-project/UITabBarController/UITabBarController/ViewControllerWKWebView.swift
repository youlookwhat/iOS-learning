//
//  ViewControllerFour.swift
//  UITabBarController
//
//  Created by 景彬 on 2022/4/4.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit
import WebKit

class ViewControllerWKWebView: UIViewController, WKScriptMessageHandler {

    var webview:WKWebView? = nil
    var bt1:UIButton? = nil
    var bt2:UIButton? = nil
    var progress:UIProgressView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarItem.title = "网页"
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        self.tabBarItem.badgeValue = "新消息"
        self.tabBarItem.badgeColor = UIColor.orange
        
        studyWKWebView()
        addToolView()
    }
    
    func studyWKWebView(){
        // 创建网页配置
        let config = WKWebViewConfiguration()

        
        // 配置线程池
//        let pool = WKProcessPool()
//        config.processPool = pool
        
        // 偏好配置
        let preference =  WKPreferences()
        // 网页界面的最小字体
        preference.minimumFontSize = 0
        // 是否支持js交互
        preference.javaScriptEnabled = true
        // 是否允许不经过用户交互由js代码自动打开窗口
        preference.javaScriptCanOpenWindowsAutomatically = true
        config.preferences = preference
        
        // 原生与js交互配置
        let useController = WKUserContentController()
        useController.add(self, name: "ios")
        
        // 向网页注入一段js代码
        let jsString = "function userFunc(){window.webkit.messageHandlers.ios.postMessage({\"name\":\"jingbin\"})};userFunc()"
        // forMainFrameOnly 是否只在主界面注入
        let userScript = WKUserScript(source: jsString, injectionTime: .atDocumentStart, forMainFrameOnly: false)
        useController.addUserScript(userScript)
        config.userContentController = useController
    
        // 要将config配置后再传入进来
        webview = WKWebView(frame: self.view.frame,configuration: config)
        self.view.addSubview(webview!)
//        let url = URL(string: "https://jinbeen.com")
        let url = URL(string: "http://www.baidu.com")
        let request = URLRequest(url: url!)
        webview!.load(request)
        
        // 执行网页中的js方法
//        webview?.evaluateJavaScript("javaScript:userFunc()", completionHandler: nil)
    }
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        // { name = jingbin;} ios
        // 如果是 班级：景彬，会是\U9ad8字样
        print(message.body,message.name)
    }
    
    
    func addToolView(){
        // 创建工具条
        let toolView = UIView(frame: CGRect(x: 0, y: self.view.frame.size.height-120, width: self.view.frame.width, height: 30))
        toolView.backgroundColor = UIColor.purple
        self.view.addSubview(toolView)
        // 添加返回按钮
        bt1 = UIButton(frame: CGRect(x: 30, y: 0, width: 70, height: 30))
        bt1!.setTitle("后退", for: .normal)
        bt1!.setTitleColor(UIColor.lightGray, for: .disabled)
        bt1!.addTarget(self, action: #selector(back), for: .touchUpInside)
        // 添加前进按钮
        bt2 = UIButton(frame: CGRect(x: 130, y: 0, width: 70, height: 30))
        bt2!.setTitle("前进", for: .normal)
        bt2!.setTitleColor(UIColor.lightGray, for: .disabled)
        bt2!.addTarget(self, action: #selector(goForward), for: .touchUpInside)
        toolView.addSubview(bt1!)
        toolView.addSubview(bt2!)
        
        // 加载进度条
        progress = UIProgressView(frame: CGRect(x: 0, y: 60, width: self.view.frame.size.width, height: 10))
        progress!.progressTintColor = UIColor.green
        progress!.progress = 0
        self.view.addSubview(progress!)
        webview?.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
     }
    
    // 监听网页进度的变化
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        progress?.progress = Float(webview!.estimatedProgress)
    }
        
    // 后退
    @objc func back(){
        if webview!.canGoBack {webview?.goBack()}
    }

    // 前进
    @objc func goForward(){
        webview?.goForward()
        // 执行网页中的js方法
        webview?.evaluateJavaScript("javaScript:userFunc()", completionHandler: nil)
    }
    
    
    
}
