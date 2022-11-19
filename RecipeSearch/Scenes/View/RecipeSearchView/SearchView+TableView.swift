//
//  SearchView+TableView.swift
//  RecipeSearch
//
//  Created by Admin on 19/11/2022.
//

import UIKit


extension RecipeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.recipeNumberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RecipeTabelViewCell = recipeTabelView.dequeueReusableCell(forIndexPath: indexPath)
        presenter.configureRecipeCell(cell: cell, index: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let lastItem = (recipes?.hits.count ?? 0) - 1
//        if indexPath.item == lastItem{
//            if recipes?.more == true {
//                interactor?.fetchAllRecipes(searchText: searchTF.searchBar.text ?? "", from: from + 10, health: healthValue, healthKey: healthValue)
//            }
//        }
        
    }
    
    
    
    
}


extension RecipeView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
