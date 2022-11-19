//
//  RecipesInterector.swift
//  RecipeSearch
//
//  Created by Admin on 19/11/2022.
//

import Foundation


class RecipesInteractor:RecipesInteractorInputProtocol{
  
    
    var presenter: RecipesInteractorOutputProtocol?
    var repository: RecipesInteractorToRepositoryProtocol
    
    init( repository: RecipesInteractorToRepositoryProtocol) {
          self.repository = repository
     }
    
    func getRecipes(searchText: String, from: Int, health: String) {
        repository.getRecipesList(searchText: searchText, from: from, health: health) {  [weak self] result in
            switch result {
            case.success(let recipe):
                self?.presenter?.recipesSuccess(Recipes: recipe)
            case.failure(let error):
                self?.presenter?.recipesFail(message: error.localizedDescription)
            }
        }
    }
    
    
}
