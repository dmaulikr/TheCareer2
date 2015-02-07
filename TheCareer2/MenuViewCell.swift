//
//  MenuViewCell.swift
//  TheCareer2
//
//  Created by baihai on 15/2/5.
//  Copyright (c) 2015年 haigamehouse. All rights reserved.
//

import UIKit

class MenuViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        println("awakeFromNib for MenuViewCell object")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        
        if selected {
            println("Selected for MenuViewCell !")
            println("THSI SI \"\(label.text!)\"")
        }
        
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
        
    }

    //
    @IBOutlet weak var label: UILabel!
}
