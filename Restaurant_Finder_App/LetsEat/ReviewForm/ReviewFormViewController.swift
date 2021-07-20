//
//  ReviewFormViewController.swift
//  LetsEat
//
//  Created by Somoplay on 2021-06-23.
//

import UIKit

class ReviewFormViewController: UITableViewController {

    
    @IBOutlet weak var ratingsView: RatingsView!
    @IBOutlet weak var tfTitle: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tvReview: UITextView!
    
    @IBAction func onSaveTapped(_ sender: Any) {
        print(ratingsView.rating)
        print(tfTitle.text as Any)
        print(tfName.text as Any)
        print(tvReview.text as Any)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }

     

}
