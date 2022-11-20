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
       var resultArray = defaults.stringArray(forKey: searchArray) ?? []
        if  resultArray.count >= 4 {
            resultArray.remove(at: 0)
        }
       resultArray.append(text)
       defaults.set(resultArray, forKey: searchArray)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addNewSearch"), object: nil)
        
        
   }
   
   func getSearchArray()-> [String]{
       let resultArray = defaults.stringArray(forKey: searchArray) ?? [String]()
       
       return resultArray.reversed()
   }
    
    func removeSearch(){
        defaults.set(nil, forKey: searchArray)
        
    }
}
