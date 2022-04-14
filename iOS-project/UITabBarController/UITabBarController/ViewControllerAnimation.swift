//
//  ViewControllerAnimation.swift
//  UITabBarController
//
//  Created by 景彬 on 2022/4/13.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit
// gif使用
import ImageIO

class ViewControllerAnimation: UIViewController {

    var animationView:UIView?
    var animationView2:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        studyAnimal()
        studyTransAnimal()
        
        studyGifImage()
        studyGifWebView()
    }
    
    // 使用UIWebView播放动画
    func studyGifWebView(){
        let imageView = UIWebView(frame: CGRect(x: 100, y: 610, width: 200, height: 150))
        self.view.addSubview(imageView)
        self.playGIFOnWebView(name: "animation", webView: imageView)
    }
    
    func playGIFOnWebView(name:String,webView:UIWebView) {
        let path = Bundle.main.path(forResource: name, ofType: "gif")
        let url = URL.init(fileURLWithPath: path!)
        let imageData = try! Data(contentsOf: url)
        webView.scrollView.bounces = false
        webView.backgroundColor = UIColor.clear
        webView.scalesPageToFit = true
        webView.load(imageData, mimeType: "image/gif", textEncodingName: "", baseURL: url)
    }
    
    //------------------------------------------
    
    
    // 使用ImageView显示Gif动画
    func studyGifImage(){
        let imageView = UIImageView(frame: CGRect(x: 100, y: 450, width: 200, height: 150))
        self.view.addSubview(imageView)
        self.playGIFOnImageView(name: "animation", imageView: imageView)
    }
    
    func playGIFOnImageView(name:String,imageView:UIImageView){
        let path = Bundle.main.path(forResource: name, ofType: "gif")
        let url = URL.init(fileURLWithPath: path!)
        let source = CGImageSourceCreateWithURL(url as CFURL, nil)
        // 图片张数
        let count = CGImageSourceGetCount(source!)
        var imageArray = Array<UIImage>()
        var imageWidth = Array<Int>()
        var imageHeight = Array<Int>()
        // 播放时长
        var time:Int = Int()
        for index in 0..<count {
            let image = CGImageSourceCreateImageAtIndex(source!, index, nil)
            imageArray.append(UIImage(cgImage: image!))
            let info = CGImageSourceCopyPropertiesAtIndex(source!, index, nil) as! Dictionary<String,AnyObject>
            let width = Int(info[kCGImagePropertyPixelWidth as String]! as! NSNumber)
            let height = Int(info[kCGImagePropertyPixelHeight as String]! as! NSNumber)
            imageWidth.append(width)
            imageHeight.append(height)
            let timeDic = info[kCGImagePropertyGIFDictionary as String] as! Dictionary<String,AnyObject>
            time += Int(timeDic[kCGImagePropertyGIFDelayTime as String] as! NSNumber)
        }
        // 重新设置gif图片的宽高
//        imageView.frame = CGRect(x: 0, y: 100, width: imageWidth[0], height: imageHeight[0])
        imageView.animationImages = imageArray
        imageView.animationDuration = TimeInterval(time)
        imageView.animationRepeatCount = 0
        imageView.startAnimating()
    }
    
    
    //------------------------------------------
    
    
    // 转场动画
    func studyTransAnimal(){
        animationView2 = UIView(frame: CGRect(x: 220, y: 300, width: 100, height: 100))
        animationView2?.backgroundColor = UIColor.red
        self.view.addSubview(animationView2!)
    }
    
    // 翻页动画
    func transAnimal1(){
        UIView.transition(with: animationView2!, duration: 3, options: .transitionCurlUp, animations: {
            
        }, completion: nil)
    }
    
    // 真正的视图转场动画，没有共享元素
    func transAnimal2(){
        let otherView = UIView(frame: CGRect(x: 20, y: 100, width: 280, height: 300))
        otherView.backgroundColor = UIColor.blue
        UIView.transition(from: animationView2!, to: otherView, duration: 3, options: .transitionFlipFromRight, completion: nil)
    }
    
    
    //------------------------------------------
    
    func studyAnimal(){
        animationView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        animationView?.backgroundColor = UIColor.red
        self.view.addSubview(animationView!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        changeColor1s()
//        changeColor1sFinish()
//        changeColor1sDelay()
        changeColor1sSpring()
        
        // 转场动画
        transAnimal1()
//        transAnimal2()
    }
    
    func changeColor1sSpring(){
       // usingSpringWithDamping 阻尼系数 1表示无回弹效果 initialSpringVelocity初始速度
        UIView.animate(withDuration: 1, delay: 0,usingSpringWithDamping: 0.5,initialSpringVelocity: 0.5 , options: [], animations: {
            self.animationView?.center = CGPoint(x: 150, y: 350)
        }, completion: nil)
    }
    
    func changeColor1sDelay(){
        UIView.animate(withDuration: 1,delay: 2,options: [UIView.AnimationOptions.repeat] ,animations: {
            // 在1秒内由红色变为蓝色
            self.animationView?.backgroundColor = UIColor.blue
        },completion: nil)
    }
    
    func changeColor1sFinish(){
        UIView.animate(withDuration: 1, animations: {
            // 在1秒内由红色变为蓝色
            self.animationView?.backgroundColor = UIColor.blue
        }) {
            // 结束后再执行其他行为
            (finish) in
            UIView.animate(withDuration: 2, animations: {
                self.animationView?.center = CGPoint(x: 150, y: 300)
            })
        }
    }
    
    func changeColor1s(){
        UIView.animate(withDuration: 1, animations: {
            // 在1秒内由红色变为蓝色
            self.animationView?.backgroundColor = UIColor.blue
        })
    }
    
    
    
    override func viewDidDisappear(_ animated: Bool) {
//        animationView = nil
        print("viewDidDisappear\(animated)")
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
