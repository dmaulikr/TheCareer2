//
//  File.swift
//  TheCareer2
//
//  Created by baihai on 15/2/7.
//  Copyright (c) 2015年 haigamehouse. All rights reserved.
//

import Foundation

func genRandomEvent()->RandomEvent?{
    if 0 == Int(arc4random()%5) {
        let count = randomEvents.count
        return randomEvents[Int(arc4random()) % count]
    }
    return nil
}
