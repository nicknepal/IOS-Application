//
//  LabTest1.swift
//  Lab_Test_2_Assignment
//
//  Created by Niraj Thapa on 14/06/2021.
//

import Foundation
import Foundation


struct NirWheel:CustomStringConvertible{
    var description: String {
        return "\(NirYear) \(NirManufactory) \(NirWheel.NirColor.Black)"
    }
    enum NirColor {
        case Black
        case Brown
        case White
    }
    let NirColor : NirColor
    let NirYear : Int
    let NirManufactory : String
    

    init(NirYear: Int, NirManufactory: String, NirColor: NirColor){
        self.NirYear = NirYear
        self.NirManufactory = NirManufactory
        self.NirColor = NirColor
    }
    
}

var Wheel = NirWheel(NirYear:1992, NirManufactory:"BridgeStone", NirColor: NirWheel.NirColor.Black)


