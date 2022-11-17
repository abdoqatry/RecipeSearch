//
//  NetworkConstants.swift
//  RecipeSearch
//
//  Created by Admin on 17/11/2022.
//

import Foundation

extension RequestProtocol {

    var baseURL: String {
        return "https://www.flickr.com/services/rest/?method=flickr.photos.search&format=json&nojsoncallback=50&text=The%20Strange%20Ones&page=1&per_page=20&api_key=a167f28144c27f2eacb6f4b26fabd9bd"
    }
}
