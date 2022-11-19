//
//  RecipeRequest.swift
//  RecipeSearch
//
//  Created by Admin on 19/11/2022.
//


import Alamofire

enum RecipesRequest: RequestProtocol {
    
    case list(from:Int,searchText:String,healthText:String,healthValue:String)
    
    var endPoint: String {
        switch self{
        case .list:
            return "recipes/v2"
            
        }
    }
    
    var method: HTTPMethod {
        switch self{
        case .list:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .list:
            return [
                "Accept" : "application/json"
            ]
        }
    }
    
    var parameters: Parameters? {
        switch self{
        case .list(let from, let searchText, let healthText,let healthValue):
            return[
                "from" : from,
                "q" : searchText,
                "app_id" : "3e6494ff",
                "app_key": "aa2e9a8440724b8aba85b68b5a911a1d",
                healthValue : healthText,
                "type" : "public"
                
            ]
        }
    }
}


