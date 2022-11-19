//
//  UIImageView+Loader.swift
//  RecipeSearch
//
//  Created by Admin on 17/11/2022.
//

import UIKit
import AlamofireImage

extension UIImageView {
    func load(with url: String?) {
        let placeholderImage = UIImage(named: "dummy")
        guard let imageURLString = url,
                let fullURLString = URL(string:imageURLString) else {
            self.image = placeholderImage
            return
        }
        af.setImage(withURL: fullURLString, placeholderImage: placeholderImage)
    }
}
