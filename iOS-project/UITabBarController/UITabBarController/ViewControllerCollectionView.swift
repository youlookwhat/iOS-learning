//
//  ViewControllerCollectionView.swift
//  UITabBarController
//
//  Created by 景彬 on 2022/4/11.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class ViewControllerCollectionView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        let cv = UICollectionView(frame: self.view.frame,collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(NSClassFromString("UICollectionViewCell"), forCellWithReuseIdentifier: "itemId")
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
