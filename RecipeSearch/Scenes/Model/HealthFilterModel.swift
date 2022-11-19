//
//  HealthFilterModel.swift
//  RecipeSearch
//
//  Created by Admin on 19/11/2022.
//

import Foundation


struct HealthFiltterModel : Model{
    let name : String
}

extension HealthFiltterModel{
    static let damyHealthFilter : [HealthFiltterModel] = [
    HealthFiltterModel(name: "All"),
    HealthFiltterModel(name: "keto-friendly"),
    HealthFiltterModel(name: "low-sugar"),
    HealthFiltterModel(name: "vegan")
    ]
    
}
