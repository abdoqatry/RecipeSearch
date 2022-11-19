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
    func removeSearch()
}

struct searchStorge  {
    
    private let searchArray = "suggestedArray"
    private let defaults = UserDefaults.standard
    
}


extension  searchStorge : getSearchSuggestionProtocol {
    
    func saveSearch(text:String){
       var urls = defaults.stringArray(forKey: searchArray) ?? []
        if  urls.count <= 10 {
            urls.remove(at: 0)
       urls.append(text)
       defaults.set(urls, forKey: searchArray)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addNewSearch"), object: nil)
        }
   }
   
   func getSearchArray()-> [String]{
       let urls = defaults.stringArray(forKey: searchArray) ?? [String]()
       
       return urls.reversed()
   }
    
    func removeSearch(){
        defaults.set(nil, forKey: searchArray)
        
    }
}
