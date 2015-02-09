//
//  SinglePropertyViewCell.swift
//  TheCareer2
//
//  Created by baihai on 15/2/6.
//  Copyright (c) 2015年 haigamehouse. All rights reserved.
//

import UIKit

class SinglePropertyViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initByTag()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setContent(name:String, value:Int){
        let leftView = viewWithTag(101) as UILabel
        leftView.text = name
        let rightView = viewWithTag(102) as UILabel
        rightView.text = String(value)
    }
    
    func sync() {
        initByTag()
    }
    
    private func initByTag(){
        switch tag {
        case 201:
            setContent("生命", value:MasterPlayer.coder.life)
        case 202:
            setContent("智商", value:MasterPlayer.coder.intelligence)
        case 203:
            setContent("人民币", value:MasterPlayer.coder.money)
        case 204:
            setContent("股份", value:MasterPlayer.coder.shares)
        case 205:
            setContent("天数剩余", value:MasterPlayer.daysLeft)
        default:
            ()
        }
    }

}
