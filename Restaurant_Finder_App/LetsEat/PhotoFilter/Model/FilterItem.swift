//
//  FilterItem.swift
//  LetsEat
//
//  Created by Somoplay on 2021-06-24.
//

import Foundation
class FilterItem:NSObject {
    let filter:String
    let name:String
    init(dict:[String:AnyObject]){
        name = dict["name"] as! String
        filter = dict["filter"] as! String
    }
}
