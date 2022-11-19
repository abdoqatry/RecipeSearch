//
//  RecipeRequest.swift
//  RecipeSearch
//
//  Created by Admin on 19/11/2022.
//


import Alamofire

enum RecipesRequest: RequestProtocol {
    
    case list(from:Int,searchText:String,healthText:String)
    
    var endPoint: String {
        switch self{
        case .list:
            return "search"
        }
    }
    
    var method: HTTPMethod {
        switch self{
        case .list:
            return .get
        }
    }
    
    var headers: HTTPHeaders? {
        nil
    }
    
    var parameters: Parameters? {
        switch self{
        case .list(let from, let searchText, let healthText):
            return[
                "from" : from,
                "q" : searchText,
                "app_id" : "3e6494ff",
                "app_key": "aa2e9a8440724b8aba85b68b5a911a1d",
                "health" : healthText
                
            ]
        }
    }
}


