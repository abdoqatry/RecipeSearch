//
//  RecipeRouter.swift
//  RecipeSearch
//
//  Created by Admin on 19/11/2022.
//

import UIKit


class RecipesRouter{
    
    weak var viewController: UIViewController?
    static func createModule() -> UIViewController {
        let view = RecipeView()
        let recipesRepository = RecipesRepository(apiClient: APICleint.shared)
        let storge = searchStorge()
        let interactor = RecipesInteractor(repository: recipesRepository, storge: storge)
           let router = RecipesRouter()
           let presenter = RecipePresenter(view: view, interactor: interactor, router: router) // dependency injection constructor Base
           view.presenter = presenter // property base dependencyInjection
           interactor.presenter = presenter
           router.viewController = view
           return view
    }
    
    
}


extension RecipesRouter :RecipesRouterProtocol {
    
    func createNavigationToRecipeDetails() -> UIViewController {
        let view = RecipeDetailsView()
           let router = RecipesRouter()
           router.viewController = view
           return view
    }
    
}
