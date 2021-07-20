//
//  LocationDataManager.swift
//  LetsEat
//
//  Created by Somoplay on 2021-06-17.
//

import Foundation
class LocationDataManager: DataManager {
    private var locations:[String] = []
    private var locationItems:[LocationItem] = []
 
    func fetch() {
        for location in load (file: "Locations") {
            locationItems.append(LocationItem(dict: location))
        }
    }
    
    
    func fetch2() {
        for location in load (file: "Locations") {
            if let city = location["city"] as? String,
               let state = location["state"] as? String {
                locations.append("\(city), \(state)")
                locationItems.append(LocationItem(city: city, state: state))
            }
        }
    }
    
    
    func numberOfItems2() -> Int {
        locationItems.count
    }
    
    func locationItem2(at index:IndexPath) -> LocationItem {
        locationItems[index.item]
    }
    
    
    func numberOfItems() -> Int {
        locations.count
    }
    
    func locationItem(at index:IndexPath) -> String {
        locations[index.item]
    }
    
    
    func findLocation (by name: String) -> (isFound:Bool, position:Int) {
        guard let index = locationItems.firstIndex (
                where: { $0.city == name} ) else {
            return (isFound:false, position:0)
        }
        return (isFound: true, position: index)
    }
    
}

//0$ is the first argument passed in the closure and 1$ is the second and 2$ is the third and so on.
