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
    var storge: getSearchSuggestionProtocol
    
    init( repository: RecipesInteractorToRepositoryProtocol,storge:getSearchSuggestionProtocol) {
          self.repository = repository
          self.storge = storge
     }
    
    func getRecipes(searchText: String, from: Int, health: String) {
        let healthValue = validateHealthfilter(text: health)
        repository.getRecipesList(searchText: searchText, from: from, health: health,healthValue:healthValue) {  [weak self] result in
            switch result {
            case.success(let recipe):
                self?.presenter?.recipesSuccess(Recipes: recipe)
                self?.storge.saveSearch(text: searchText)
            case.failure(let error):
                self?.presenter?.recipesFail(message: error.localizedDescription)
            }
        }
    }
    
    func validateHealthfilter(text:String)-> String{
        if text == "All" || text == "" {
            return ""
        }
        return "health"
    }
    
    
}
