//
//  FilterCell.swift
//  LetsEat
//
//  Created by Somoplay on 2021-06-24.
//

import UIKit

class FilterCell: UICollectionViewCell {
    @IBOutlet var lblName: UILabel!
    @IBOutlet var imgThumb: UIImageView!
}

extension FilterCell: ImageFiltering {
    
    func set(image:UIImage, item:FilterItem) {
        if item.filter != "None" {
            let filteredImg = apply(filter: item.filter,
                                    originalImage: image)
            imgThumb.image = filteredImg
        } else {
            imgThumb.image = image
        }
        lblName.text = item.name
    }
    
    //awakeFromNib() is called after the FilterCell instance has been loaded,
    //and the two statements inside it round the corners of the image view.
    override func awakeFromNib() {
        super.awakeFromNib()
        imgThumb.layer.cornerRadius = 9
        imgThumb.layer.masksToBounds = true
    }
}
