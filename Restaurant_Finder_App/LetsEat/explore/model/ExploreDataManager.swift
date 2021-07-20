//
//  ExploreDataManager.swift
//  LetsEat
//
//  Created by Somoplay on 2021-06-16.
//

import Foundation

class ExploreDataManager: DataManager {
    fileprivate var items: [ExploreItem] = []
    
    
    func fetch() {
        for data in load (file: "ExploreData") {
            items.append(ExploreItem(dict: data))
        }
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func explore(at index: IndexPath) -> ExploreItem {
        items[index.item]
    }
    
   
}
