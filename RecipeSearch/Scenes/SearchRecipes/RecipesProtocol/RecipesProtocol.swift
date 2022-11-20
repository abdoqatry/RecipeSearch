//
//  RecipesProtocol.swift
//  RecipeSearch
//
//  Created by Admin on 19/11/2022.
//

import UIKit

protocol RecipesRouterProtocol:AnyObject {
    func createModule2() -> UIViewController
}

// presenter Protocol
protocol RecipesViewProtocol:AnyObject { // viewController
    var presenter: RecipesPresenterProtocol! { get set } //reference of presenter
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func recipeSuccefully()
    func recipeFail(message:String)
    func goToRecipeDetails(vc:UIViewController)
}
protocol RecipesPresenterProtocol: AnyObject {
    var view:RecipesViewProtocol? { get set }
    var recipeNumberOfRows: Int { get }
    var filterHealthNumberOfRows: Int { get }
    func getRecipe(searchText: String, from: Int, health: String)
    func configureRecipeCell(cell:RecipeTabelViewCell,index:Int)
    func configureFilterCell(cell:HealthFiltterCollectionCell,index:Int)
    func selectfilterCell(index:Int,searchText:String)
    func selectRecipeCell(index:Int,RecipeId:Int)
}

// Repository protocol
protocol RecipesInteractorToRepositoryProtocol {
    func getRecipesList(searchText: String, from: Int, health: String ,healthValue:String,compeletion: @escaping (Result<RecipeModel, CustomNetworkError>) -> Void)
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
