//
//  RecipeModel.swift
//  RecipeSearch
//
//  Created by Admin on 19/11/2022.
//

import Foundation


struct RecipeModel: Model {
    let from : Int
    let more : Bool
    let hits: [Hits]
    
}
    struct Hits : Model{
        let recipe : hits
    }

    struct hits: Model {
        
        let label: String
        let image : String
        let source: String
    }


