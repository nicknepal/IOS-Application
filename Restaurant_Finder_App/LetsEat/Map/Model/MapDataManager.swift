//
//  MapDataManager.swift
//  LetsEat
//
//  Created by Somoplay on 2021-06-18.
//
import MapKit
import Foundation


class MapDataManager : DataManager{
    
    fileprivate var items: [RestaurantItem] = []
    
    var annotations:[RestaurantItem] {
        return items
    }
    
    func fetch(completion: (_ annotations: [RestaurantItem]) -> ()){
//        if items.count > 0 {
//            items.removeAll()
//        }
//        for data in load (file: "MapLocations") {
//            items.append(RestaurantItem(dict: data))
//        }
//        completion(items)
        
        
        let manager = RestaurantDataManager()
        manager.fetch(by: "Boston", completionHandler: {
            (items) in self.items = items
            completion(items)
        })
    }
    
    func currentRegion(latDelta:CLLocationDegrees, longDelta:CLLocationDegrees) -> MKCoordinateRegion {
        guard let item = items.first else {
            return MKCoordinateRegion()
        }
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        return MKCoordinateRegion(center:item.coordinate, span:span)
    }
    
}
