//
//  RecipeView.swift
//  RecipeSearch
//
//  Created by Admin on 19/11/2022.
//

import UIKit

class RecipeView: UIViewController {

    
    @IBOutlet weak var recipeTabelView: UITableView!{
        didSet {
            recipeTabelView.delegate = self
            recipeTabelView.dataSource = self
            recipeTabelView.registerCell(withCellType: RecipeTabelViewCell.self)
        }
    }

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
    var presenter: RecipesPresenterProtocol!
    let cellHeight = 140.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.getRecipe(searchText: "s", from: 10, health: "")
    }
    
    
    
    

}



extension RecipeView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RecipeTabelViewCell = recipeTabelView.dequeueReusableCell(forIndexPath: indexPath)
        presenter.configure(cell: cell, index: indexPath.row)
        
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



extension RecipeView :RecipesViewProtocol {
    
    func showLoadingIndicator() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func hideLoadingIndicator() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func recipeSuccefully() {
        recipeTabelView.reloadData()
    }
    
    func recipeFail(message: String) {
        print(message)
    }
    
}
