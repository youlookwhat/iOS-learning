//
//  ViewControllerThree.swift
//  UITabBarController
//
//  Created by 景彬 on 2022/4/4.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewControllerThree: UIViewController , UIWebViewDelegate {

    var webview:UIWebView? = nil
    var bt1:UIButton? = nil
    var bt2:UIButton? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        let item = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        self.tabBarItem.title = "网页"
        self.tabBarItem = item
        
        studyUIWebView()
    }
    
    func studyUIWebView(){
        webview = UIWebView(frame: self.view.bounds)
        let url = URL(string: "https://jinbeen.com")
        let request =  URLRequest(url: url!)
        webview!.loadRequest(request)
        webview?.delegate = self
        self.view.addSubview(webview!)
        
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
    }
    
    // 后退
    @objc func back(){
        if webview!.canGoBack {webview?.goBack()}
    }
    
    // 前进
    @objc func goForward(){
        webview?.goForward()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        // 返回false禁止此次加载
        return true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("开始加载URL请求时被调用")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("加载完成")
        bt1?.isEnabled = webView.canGoBack
        bt2?.isEnabled = webView.canGoForward
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        print("加载失败")
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
