//
//  RecipePresenter.swift
//  RecipeSearch
//
//  Created by Admin on 19/11/2022.
//

import Foundation


class RecipePresenter{
    
    var presenter: RecipesPresenterProtocol!
    weak var view: RecipesViewProtocol?
    private let interactor: RecipesInteractorInputProtocol
    private let router:RecipesRouterProtocol
    var recipesList : [Hits] = []
    init(view: RecipeView, interactor: RecipesInteractorInputProtocol,router: RecipesRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    var numberOfRows: Int {
        return recipesList.count
    }
}

extension  RecipePresenter:RecipesPresenterProtocol,RecipesInteractorOutputProtocol {
    
    func getRecipe(searchText: String, from: Int, health: String) {
        view?.showLoadingIndicator()
        interactor.getRecipes(searchText: searchText, from: from, health: health)
    }
    
    func configure(cell: RecipeTabelViewCell, index: Int) {
        let data = recipesList[index]
        cell.configure(viewModel: data)
    }
    
    func recipesFail(message: String) {
        view?.hideLoadingIndicator()
        view?.recipeFail(message: message)
    }
    
    func recipesSuccess(Recipes: RecipeModel) {
        view?.hideLoadingIndicator()
        recipesList = Recipes.hits
        view?.recipeSuccefully()
    }
    
    
}
