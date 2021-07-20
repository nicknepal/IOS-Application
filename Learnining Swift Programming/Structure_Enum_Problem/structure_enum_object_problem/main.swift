//
//  main.swift
//  Lab_Test_2_Assignment
//
//  Created by Niraj Thapa on 10/06/2021.
//


import Foundation

//printing car information
var nirCar1 = NirCar(nirColor: NirColour.blue, nirYear:1990, nirManufactory: "Hyundai", nirWheels: [ newWheel1 ])

//Adding car on wheel info in the car obj
nirCar1.nirAddWheel(oneWheel: newWheel2)

nirCar1.nirAddWheel(oneWheel: newWheel3)

nirCar1.nirAddWheel(oneWheel: newWheel4)

print(nirCar1.nirCarInfo())

//number of wheels in the array
print(nirCar1.nirGetNumberOfWheels())

//remove wheel from the array using index number
nirCar1.nirRemoveWheel(index:2)



