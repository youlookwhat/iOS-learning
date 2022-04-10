//
//  TableViewProCellTableViewCell.swift
//  UITabBarController
//
//  Created by 景彬 on 2022/4/10.
//  Copyright © 2022 景彬. All rights reserved.
//

import UIKit

class TableViewProCell: UITableViewCell {

    
    @IBOutlet weak var proImageView: UIImageView!
    
    @IBOutlet weak var proTitle: UILabel!
    
    @IBOutlet weak var proSubTitle: UILabel!
    
    @IBOutlet weak var proPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        proImageView.layer.borderWidth = 1
//        proImageView.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
