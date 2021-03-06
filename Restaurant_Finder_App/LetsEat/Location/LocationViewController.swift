//
//  LocationViewController.swift
//  LetsEat
//
//  Created by Somoplay on 2021-06-17.
//

import UIKit

class LocationViewController: UIViewController {
 
    @IBOutlet weak var tableView: UITableView!
 
    let manager = LocationDataManager()
    var selectedCity: LocationItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    
    
    
    func set(selected cell:UITableViewCell, at indexPath: IndexPath) {
        if let city = selectedCity?.city {
            let data = manager.findLocation(by: city)
            if data.isFound {
                if indexPath.row == data.position {
                    cell.accessoryType = .checkmark
                }
                else { cell.accessoryType = .none }
            }
        }
        else {
            cell.accessoryType = .none
        }
    }
}




// MARK: Private Extension
private extension LocationViewController {
    func initialize() {
        manager.fetch()
    }
}




// MARK: UITableViewDataSource
extension LocationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        manager.numberOfItems2()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as! LocationCell
        cell.cityName.text = manager.locationItem2(at:indexPath).city
        cell.stateName.text = manager.locationItem2(at:indexPath).state
        set(selected: cell, at: indexPath)
        return cell
    }
    
}




//MARK: UITableViewDelegate
 
extension LocationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            selectedCity = manager.locationItem2(at: indexPath)
            tableView.reloadData()
        }
    }
}
