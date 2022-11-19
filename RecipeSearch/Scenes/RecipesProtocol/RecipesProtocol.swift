//
//  RecipesProtocol.swift
//  RecipeSearch
//
//  Created by Admin on 19/11/2022.
//

import Foundation

protocol RecipesRouterProtocol {
   
}

// presenter Protocol
protocol RecipesViewProtocol:AnyObject { // viewController
    var presenter: RecipesPresenterProtocol! { get set } //reference of presenter
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func recipeSuccefully()
    func recipeFail(message:String)
}
protocol RecipesPresenterProtocol: AnyObject {
    var view:RecipesViewProtocol? { get set }
    var numberOfRows: Int { get }
     func getRecipe(searchText: String, from: Int, health: String)
   func configure(cell:RecipeTabelViewCell,index:Int)
   
}

// Repository protocol
protocol RecipesInteractorToRepositoryProtocol {
    func getRecipesList(searchText: String, from: Int, health: String, compeletion: @escaping (Result<RecipeModel, CustomNetworkError>) -> Void)
}

protocol RecipesRepositoryProtocol: RecipesInteractorToRepositoryProtocol {
    var apiClient: APICleintProtocol { get }
}


// interactor Protocol
protocol RecipesInteractorInputProtocol { //interactor
    var presenter: RecipesInteractorOutputProtocol? { get set }
    func getRecipes(searchText: String, from: Int, health: String)
   
}

protocol RecipesInteractorOutputProtocol: AnyObject { // func execute when data come
     func recipesFail(message: String)
    func recipesSuccess(Recipes:RecipeModel)
    
}
