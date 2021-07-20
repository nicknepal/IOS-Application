//
//  main.swift
//  Final_Exam_Assignment_2
//
//  Created by Niraj Thapa on 11/06/2021.
//


import Foundation


// Creating objects from each class

var motor = NirMotorVehicle(NirYear: 1992, NirColor: NirColor.black)

var myBoat  = NirBoat(nirBoatYear: 2020, nirBoatColor: NirColor.blue, nirQuantInfo: "Tuna Fishing Boat", nirBoatPrice: 50000.00, nirBoatFrequency: 55)

var nirCar1 = NirCar(nirCarYear: 2019, nirCarColor: NirColor.silver,  nirWheelInfo: "Iron Wheels", nirCarPrice: 340000, nirCarFrequency: 57)



// The array of object of NirMotorVehicle
var nirMotorVehicleArray: [NirMotorVehicle] = [motor, myBoat, nirCar1]
print( type(of: nirMotorVehicleArray) )

for vehicle in nirMotorVehicleArray {
    print(vehicle)
}

print("\n ---------- \n")

var nirBicycle = NirBicyle(nirBrandName: "Mountain Bike")
var nirPedestrain = NirPedestrain(nirName: "Luffy")


// defining array of object
var nirStreetLegalArray : [NirStreetLegal] = [nirCar1, nirBicycle, nirPedestrain]

for list in nirStreetLegalArray{
    print(list)
}
