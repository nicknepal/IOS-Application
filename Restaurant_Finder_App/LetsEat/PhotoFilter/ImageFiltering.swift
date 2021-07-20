//
//  ImageFiltering.swift
//  LetsEat
//
//  Created by Somoplay on 2021-06-24.
//

import Foundation
import UIKit
import CoreImage

protocol ImageFiltering {
    func apply(filter:String, originalImage:UIImage) ->
    UIImage
}

extension ImageFiltering {
    
    func apply(filter: String, originalImage: UIImage) ->
    UIImage {
        
        let initialCIImage = CIImage(image: originalImage,
                                     options: nil)
        let originalOrientation = originalImage.imageOrientation
        
        guard let ciFilter = CIFilter(name: filter) else {
            print("filter not found")
            return UIImage()
        }
        
        //  apply the selected filter to initiaCIImage and stores the result
        ciFilter.setValue(initialCIImage, forKey: kCIInputImageKey)
        let context = CIContext()
        let filteredCIImage = (ciFilter.outputImage)!
        
        //convert CIImage to UIImage
        let filteredCGImage = context.createCGImage(filteredCIImage, from:
                                    filteredCIImage.extent)
        return UIImage(cgImage: filteredCGImage!, scale: 1.0,
                       orientation: originalOrientation)
    }
}
