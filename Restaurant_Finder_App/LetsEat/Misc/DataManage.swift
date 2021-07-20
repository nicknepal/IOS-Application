//
//  DataManager.swift
//  LetsEat
//
//  Created by Somoplay on 2021-06-18.
//

import Foundation
protocol DataManager {
    func load(file name:String) -> [[String:AnyObject]]
    
    
}
 
 
extension DataManager {
    
    func load(file name:String) -> [[String:AnyObject]] {
        guard let path = Bundle.main.path(forResource: name, ofType: "plist"),
              let items = NSArray(contentsOfFile: path)
        else {
            return [[:]]
        }
        return items as! [[String:AnyObject]]
    }
    
}



