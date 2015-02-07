//
//  CareerTypeViewCell.swift
//  TheCareer2
//
//  Created by baihai on 15/2/5.
//  Copyright (c) 2015年 haigamehouse. All rights reserved.
//

import UIKit

class CareerTypeViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // Born is single-selection.
    // The non-selected will be mentioned, as well as the selected ones
    // The 'selected' distinguishes.
    /*
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            let label = viewWithTag(101) as UILabel!
            MasterPlayer.setCareer(label.text!)
        }
        accessoryType = selected ? .Checkmark : .None
    }*/

    @IBOutlet weak var label: UILabel!
}
