//
//  RecipeModel.swift
//  RecipeSearch
//
//  Created by Admin on 19/11/2022.
//

import Foundation


struct RecipeModel: Model {
    let from : Int
    let hits: [Hits]
    
}
    struct Hits : Model{
        let recipe : Recipe
    }

    struct Recipe: Model {
        
        let label: String
        let image : String
        let source: String
    }


