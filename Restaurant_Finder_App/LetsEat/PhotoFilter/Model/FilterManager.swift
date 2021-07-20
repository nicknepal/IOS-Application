//
//  FilterManager.swift
//  LetsEat
//
//  Created by Somoplay on 2021-06-24.
//

import Foundation
class FilterManager: DataManager {
    func fetch(completionHandler: (_ items:[FilterItem]) ->
                Void) {
        var items: [FilterItem] = []
        for data in load(file: "FilterData") {
            items.append(FilterItem(dict: data))
        }
        completionHandler(items)
    }
}
