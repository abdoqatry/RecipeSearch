//
//  RecipeRepository.swift
//  RecipeSearch
//
//  Created by Admin on 19/11/2022.
//

import Foundation


struct RecipesRepository {
    
    // MARK: - Dependencies
    
    var apiClient: APICleintProtocol
}


extension RecipesRepository : RecipesRepositoryProtocol {
    
    func getRecipesList(searchText: String, from: Int, health: String,healthValue:String,compeletion: @escaping (Result<RecipeModel, CustomNetworkError>) -> Void) {
        let request = RecipesRequest.list(from: from, searchText: searchText, healthText: health, healthValue: healthValue)
        apiClient.send(request: request, compeletion: compeletion)
    }
    
}
