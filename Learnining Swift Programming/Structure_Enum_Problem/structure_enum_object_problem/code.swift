//
//  code.swift
//  Lab_Test_2_Assignment
//
//  Created by Niraj Thapa on 10/06/2021.
//

import Foundation

 
enum NirColour: String {
        case black
        case blue
        case red
        case green
        case silver
        case brown
        case orange
        case golden
    }
    

//First I created Wheel struct, to create an array of wheel object)

struct NirWheel: CustomStringConvertible {
    var description: String {
         return "The wheel with \(nirColor) color is manufactured by \(nirManufactory) in the year \(nirYear)"
    }
    
    var nirColor: NirColour
    var nirYear: Int
    var nirManufactory: String
    
    init(nirColor: NirColour, nirYear: Int, nirManufactory: String) {
        self.nirColor = nirColor
        self.nirYear = nirYear
        self.nirManufactory = nirManufactory
    }
    
}

//adding wheel objects

var newWheel1 = NirWheel(nirColor: .golden, nirYear: 1962, nirManufactory: "Borbet")
var newWheel2 = NirWheel(nirColor: .brown, nirYear: 1992, nirManufactory: "Enkei")
var newWheel3 = NirWheel(nirColor: .blue, nirYear: 1977, nirManufactory: "Ronal")
var newWheel4 = NirWheel(nirColor: .silver, nirYear: 1989, nirManufactory: "CMWheel")



// now nirCar struct has functions to add, remove or get number of wheels

struct NirCar{
    var nirColor : NirColour
    var nirYear : Int
    var nirManufactory : String
    var nirWheels : [ NirWheel ]
    
    init(nirColor: NirColour, nirYear: Int, nirManufactory: String , nirWheels : [NirWheel]){
        self.nirColor = nirColor
        self.nirYear = nirYear
        self.nirManufactory = nirManufactory
        self.nirWheels = nirWheels
        
    }
    
    // Add a wheel to the wheel array
    mutating func nirAddWheel(oneWheel : NirWheel ){
        nirWheels.append(oneWheel)
    }
    
    // Remove a wheel to the wheel array
    mutating func nirRemoveWheel( index : Int){
        if index < nirWheels.count{
            print("\(nirWheels[index].nirManufactory) wheel is removed from the list.")
            nirWheels.remove(at: index)
        }else{
            print("No such Wheel to remove. Please enter a valid index \n")
        }
    }
    
    // Get number of wheels in the array
    func nirGetNumberOfWheels() -> String{
        return "Number of wheels in the list is \(nirWheels.count) \n"
    }
    
    func nirCarInfo() -> String{
        let string1 = "The Properties of car with color \(nirColor), manufactured in the year \(nirYear) by \(nirManufactory). \n"
        let string2: String = "Different avaiable wheels of the car are shown below Color Year Manufacturer \n"
        var string3: String = ""
        
        for wheel in nirWheels{
            string3 += "\(wheel.nirColor)   \(wheel.nirYear)    \(wheel.nirManufactory)\n"
        }
        
        return string1 + string2 + string3
    }
    
}

