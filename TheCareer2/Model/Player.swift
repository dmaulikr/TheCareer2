//
//  Player.swift
//  TheCareer2
//
//  Created by baihai on 15/2/5.
//  Copyright (c) 2015年 haigamehouse. All rights reserved.
//

import Foundation

protocol EnumType{
    func description()->String
}

enum Career:Int, EnumType{
    case Coder = 0
    case Programmer
    case Architect
    
    func description()->String{
        switch self{
        case .Coder:
            return "Coder"
        case .Programmer:
            return "Programmer"
        case .Architect:
            return "Architect"
        default:
            fatalError("No such type for self")
        }
    }
    
    static func fromString(rawValue:String)->Career{
        switch rawValue{
            case "Coder":
                return .Coder
            case "Programmer":
                return .Programmer
            case "Architect":
                return .Architect
            default:
                fatalError("No such career")
        }
    }
    
    static func fromInt(rawValue:Int)->Career{
        switch rawValue{
        case 0:
            return .Coder
        case 1:
            return .Programmer
        case 2:
            return .Architect
        default:
            fatalError("No such code")
        }
    }
}

enum Gender:Int, EnumType{
    case Male = 0
    case Gay
    
    func description()->String{
        switch self {
        case .Male:
            return "男"
        case .Gay:
            return "男同志"
        default:
            fatalError("No such gender")
        }
    }
    
    static func fromString(string:String)->Gender{
        switch string{
        case "男":
            fallthrough
        case "Male":
            return .Male
        case "男同志":
            fallthrough
        case "Gay":
            return .Gay
        default:
            fatalError("No such gender string")
        }
    }
    
    static func fromInt(rawValue:Int)->Gender{
        switch rawValue{
        case 0:
            return .Male
        case 1:
            return .Gay
        default:
            fatalError("No such gender for int \(rawValue)")
        }
    }
}

class Player {
    
    func setCareer(type:String){
        career = Career.fromString(type)
        //println("Now career is set to \(career.description())")
    }
    
    func setGender(gender:String){
        self.gender = Gender.fromString(gender)
        //println("Now gender is set to \(self.gender.description())")
    }
    
    func receiveWork(workNo:Int){
        assert( workNo >= 0 && workNo < officeEvents.count, "Must be within this range")
        coder += officeEvents[workNo].event
    }
    
    func receiveSports(sportsNo:Int){
        assert( sportsNo >= 0 && sportsNo < sportsEvents.count, "Must be within this range")
        coder += sportsEvents[sportsNo].event
    }

    var career:Career = .Coder  // Always the basic
    var gender:Gender = .Male
    
    var coder = CoderAttributes()
}

// The Singleton
let MasterPlayer = Player()