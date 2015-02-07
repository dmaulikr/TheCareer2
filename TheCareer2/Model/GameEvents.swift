//
//  Events.swift
//  TheCareer2
//
//  Created by baihai on 15/2/6.
//  Copyright (c) 2015年 haigamehouse. All rights reserved.
//

import Foundation

class DigitalProperty:EventProto {

    init(shares:Int, money:Int, life:Int, intelli:Int){
        sharesChange = shares
        moneyChange = money
        lifeChange = life
        intelligenceChange = intelli
    }
    
    func description()->String{
        var info:String = ""
        
        var pre = false
        if moneyChange != 0 {
            if moneyChange > 0 {
                info += "赚取人民币\(moneyChange)"
            } else {
                info += "消耗人民币\(-moneyChange)"
            }
            pre = true
        }
        
        if intelligenceChange != 0 {
            if pre {
                info += ", "
            }
            switch intelligenceChange{
            case let x where x > 0:
                info += "智商增加\(intelligenceChange)"
            case let x where x < 0:
                info += "智商减少\(-intelligenceChange)"
            default:
                ()
            }
            pre = true
        }
        
        if lifeChange != 0 {
            if pre {
                info += ", "
            }
            switch lifeChange {
            case let x where x > 0 :
                info += "生命增加\(lifeChange)"
            case let x where x < 0 :
                info += "生命减少\(-lifeChange)"
            default:
                ()
            }
            pre = true
        }
        
        if sharesChange != 0 {
            if pre {
                info += ", "
            }
            switch sharesChange {
            case let x where x > 0:
                info += "股份增持\(sharesChange)"
            case let x where x < 0:
                info += "股份减少\(-sharesChange)"
            default:
                ()
            }
        }
        return info
    }
    
    var sharesChange:Int
    var moneyChange:Int
    var lifeChange:Int
    var intelligenceChange:Int
}

class CoderAttributes{
    var shares:Int = 0
    var money:Int = 2000
    var life:Int = 100
    var intelligence:Int = 120
}

func +=(inout ca:CoderAttributes, dp:DigitalProperty)->CoderAttributes{
    ca.life  += dp.lifeChange
    ca.money += dp.moneyChange
    ca.intelligence += dp.intelligenceChange
    ca.shares       += dp.sharesChange
    return ca
}

class FieldEvent:EventProto{
    
    init(share:Int, money:Int, life:Int, intelli:Int, name:String){
        event = DigitalProperty(shares:share, money:money, life:life, intelli:intelli)
        self.name = name
    }
    
    convenience init(share:Int, money:Int, life:Int, intelli:Int, name:String, append:String){
        self.init(share:share, money:money, life:life, intelli:intelli, name:name)
        self.appendInfo = append
    }
    
    convenience init(share:Int, money:Int, life:Int, intelli:Int, name:String, appends:[String]){
        self.init(share:share, money:money,life:life, intelli:intelli, name:name)
        self.appendInfos = appends  // This is a full copy.
    }

    //////////////////////////////
    // The controlling view shall deal with '\n'
    func description()->String{
        var stringText = "你刚才在办公室" + name + ", \n" + event.description()
        if appendInfos != nil {
            let count = appendInfos?.count
            let offset = Int(arc4random()) % count!
            let info = appendInfos?[offset]
            stringText += ", \n"
            stringText += info!         // Unwrapp
        }else if appendInfo != nil {
            stringText += ", \n"
            stringText += appendInfo!
        }
        return stringText
    }
    
    var event:DigitalProperty
    var name:String
    var appendInfo:String?
    var appendInfos:[String]?
}

class SportsEvent:FieldEvent{
    init(life:Int, intelli:Int, name:String){
        super.init(share:0, money:0, life:life, intelli:intelli, name:name)
    }
    
    init(life:Int, intelli:Int, name:String, appends:[String]){
        super.init(share:0, money:0, life:life, intelli:intelli, name:name)
        appendInfos = appends
    }
}
