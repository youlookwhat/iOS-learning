//
//  ViewControllerCollectionView.swift
//  UITabBarController
//
//  Created by 景彬 on 2022/4/11.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewControllerCollectionView: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 学习UICollectionViewFlowLayout
//        studyUICollectionViewFlowLayout()
        
        // 瀑布流
        studyWaterFallLayout()
        
        
    }
    
    func studyWaterFallLayout(){
        let layout = WaterFallLayout(itemCount: 30)
        let collectionView  =  UICollectionView(frame: self.view.frame,collectionViewLayout: layout)
        
        impl = CollectionViewImp()
        collectionView.delegate = impl
        collectionView.dataSource = impl

//        collectionView.delegate = self
//        collectionView.dataSource = self
        
        collectionView.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "itemId")
        self.view.addSubview(collectionView)
    }
    
    
    // 内部类一定要成员变量？，类似的在 let searchClass = SearchController()
    var impl : CollectionViewImp?

    class CollectionViewImp :NSObject,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
        
        // 分区个数
       func numberOfSections(in collectionView: UICollectionView) -> Int {
           return 1
       }
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 30
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemId", for: indexPath)
            cell.backgroundColor = UIColor(red: CGFloat(arc4random()%255)/255, green: CGFloat(arc4random()%255)/255, blue: CGFloat(arc4random()%255)/255, alpha: 1)
            return cell
        }
        
    }
    
    
    
    //------------------------------------------------------------------

    func studyUICollectionViewFlowLayout(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        let cv = UICollectionView(frame: self.view.frame,collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "itemId")
        
        // 流式布局配置
        // 最小行间距
        layout.minimumLineSpacing = 30
        // 最小列间距
        layout.minimumInteritemSpacing = 100
        // 头视图尺寸
        layout.headerReferenceSize = CGSize(width: self.view.frame.size.width, height: 100)
        layout.footerReferenceSize = CGSize(width: self.view.frame.size.width, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        self.view.addSubview(cv)
    }
    
    
    // 分区个数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // 分区的item数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemId", for: indexPath)
        cell.backgroundColor = UIColor.red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("第\(indexPath.row)个item被点击")
    }
    
    
    // -----------  FlowLayout  流式布局
    // 可以自定义高度，不过要继承UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath:IndexPath) -> CGSize {
        if indexPath.row%2==0 {
            return CGSize(width: 50, height: 50)
        } else {
            return CGSize(width: 100, height: 100)
        }
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
