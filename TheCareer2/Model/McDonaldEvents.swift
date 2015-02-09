//
//  McDonaldEvents.swift
//  TheCareer2
//
//  Created by baihai on 15/2/7.
//  Copyright (c) 2015年 haigamehouse. All rights reserved.
//

import Foundation


let mcDonaldEvents = [
    McDonaldEvent(life:1, money:-20, name:"原味汉堡"),
    McDonaldEvent(life:2, money:-30, name:"薯条"),
    McDonaldEvent(life:3, money:-50, name:"咖啡",
        appends:[
            "感觉变身超级赛亚人",
            "感觉仿佛要吐了但是战斗力意外的强"
        ]
    ),
    McDonaldEvent(life:-10, money:10, name:"板烧鸡腿堡",
        appends:[
            "永远都是第一次最好吃",
            "再也不想吃这货了",
            "再也吃不起这货了"
        ]
    )
]