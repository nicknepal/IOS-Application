//
//  LocationCell.swift
//  LetsEat
//
//  Created by Somoplay on 2021-06-17.
//

import UIKit

class LocationCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var stateName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
