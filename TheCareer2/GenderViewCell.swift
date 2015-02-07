//
//  GenderViewCell.swift
//  TheCareer2
//
//  Created by baihai on 15/2/5.
//  Copyright (c) 2015年 haigamehouse. All rights reserved.
//

import UIKit

class GenderViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if let label = self.viewWithTag(101) as? UILabel {
            currentGender = Gender.fromString(label.text!)
        }
    }

    /*
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        let label = self.viewWithTag(101) as? UILabel
        if (label != nil && selected) {
            let genderString = label?.text!
            MasterPlayer.setGender(genderString!)
        }
        
        if (currentGender == MasterPlayer.gender){
            accessoryType = .Checkmark
        } else {
            accessoryType = .None
        }
        // Configure the view for the selected state
    }*/
    
    @IBOutlet weak var labelTextLabel: UILabel!
    var currentGender:Gender?
}
