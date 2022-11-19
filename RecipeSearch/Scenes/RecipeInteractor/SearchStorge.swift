//
//  SearchStorge.swift
//  RecipeSearch
//
//  Created by Admin on 19/11/2022.
//

import Foundation


protocol getSearchSuggestionProtocol{

    func saveSearch(text:String)
    func getSearchArray()->[String]
}

struct searchStorge  {
    
    private let searchArray = "suggestedArray"
    private let defaults = UserDefaults.standard
    
    func removeSearch(){
        defaults.set(nil, forKey: searchArray)
        defaults.synchronize()
    }
    
}


extension  searchStorge : getSearchSuggestionProtocol {
    
    func saveSearch(text:String){
       var urls = defaults.stringArray(forKey: searchArray) ?? []
//        if text != "" && urls.count <= 10 {
       urls.append(text)
       defaults.set(urls, forKey: searchArray)
        defaults.synchronize()
//        }
   }
   
   func getSearchArray()-> [String]{
       let urls = defaults.stringArray(forKey: searchArray) ?? [String]()
       
       return urls
   }
}
