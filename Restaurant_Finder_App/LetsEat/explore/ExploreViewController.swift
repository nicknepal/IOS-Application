//
//  ExploreViewController.swift
//  LetsEat
//
//  Created by Somoplay on 2021-06-11.
//

import UIKit

class ExploreViewController: UIViewController, UICollectionViewDelegate {
  
    let manager = ExploreDataManager()
    var selectedCity: LocationItem?
    var headerView: ExploreHeaderView!
     

    @IBOutlet weak var collectionView: UICollectionView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    //if location(city) is not nil than goes to restaurant listed page or through restaurantList segue
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == Segue.restaurantList.rawValue {
            guard selectedCity != nil else {
                showAlert()
                return false
            }
            return true
        }
        return true
    }
    
    
    //if segue identifier is locationlist than goes to select locationList VC and if segue idenitfier is restaurantList than goes to explorerVC with location already selected
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case Segue.locationList.rawValue:
            showLocationList(segue: segue)
        case Segue.restaurantList.rawValue:
            showRestaurantListing(segue: segue)
        default:
            print("Segue not added")
        }
    }
    
}


// MARK: Private Extension
private extension ExploreViewController {
    func initialize() {
        manager.fetch()
    }
    
    
    func showAlert() {
        let alertController = UIAlertController(title: "Location Needed", message: "Please select a location.", preferredStyle:.alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    //by clicking "Cancel" button in the select location page - this func returns to the main explorer page
    @IBAction func unwindLocationCancel(segue:UIStoryboardSegue){
    }
    
    //by clicking "Done" button in the select location page - this func returns to the main explorer page with location data selected
    @IBAction func unwindLocationDone(segue:UIStoryboardSegue) {
        if let viewController = segue.source as? LocationViewController {
            selectedCity = viewController.selectedCity
            if let location = selectedCity {
                headerView.lblLocation.text = location.full
            }
        }
    }
    
    

    func showLocationList(segue:UIStoryboardSegue){
        guard let navController = segue.destination as? UINavigationController,
              let viewController = navController.topViewController as? LocationViewController else {
            return
        }
        guard let city = selectedCity else { return }
        viewController.selectedCity = city
    }

    
    func showRestaurantListing(segue:UIStoryboardSegue) {
        if let viewController = segue.destination as? RestaurantListViewController,
           let city = selectedCity,
           let index = collectionView.indexPathsForSelectedItems?.first {
            viewController.selectedType = manager.explore(at:index).name
            viewController.selectedCity = city
        }
    }
}



// MARK: UICollectionViewDataSource
extension ExploreViewController: UICollectionViewDataSource {
    
    
    //what type of header we want in secondary pages to the mainExplorer page (resuable header)
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath)
    -> UICollectionReusableView {
 
        let header = collectionView.dequeueReusableSupplementaryView (ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        headerView = header as? ExploreHeaderView
        return headerView
  
    }
    
    //numberofitems() func is at exploreDataManager
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return manager.numberOfItems()
    }
    
    //reusable/repeatable cells in mainExploreVC
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "exploreCell", for: indexPath) as! ExploreCell
        let item = manager.explore(at: indexPath)
        cell.lblName.text = item.name
        cell.imageExplore.image = UIImage(named: item.image)
        return cell
    }
    
}
