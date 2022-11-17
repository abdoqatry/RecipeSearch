//
//  DomainURL.swift
//  RecipeSearch
//
//  Created by Admin on 17/11/2022.
//

import Foundation


enum DomainURL {
    
    case production(fram: Int,server:String,id:String,secret:String)
    
    var path: String {
        switch self {
        case .production(let fram,let server,let id,let secret):
            return "http://farm​\(fram)​.static.flickr.com/​\(server)​/​\(id)​_​\(secret)​.jpg"
        }
    }
}

