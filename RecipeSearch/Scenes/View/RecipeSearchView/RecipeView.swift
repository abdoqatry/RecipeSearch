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
    
    @IBOutlet weak var healthCollectionView: UICollectionView!{
        didSet {
            healthCollectionView.delegate = self
            healthCollectionView.dataSource = self
            healthCollectionView.registerCell(withCellType: HealthFiltterCollectionCell.self)
        }
    }

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
    var presenter: RecipesPresenterProtocol!
    let cellHeight = 140.0
    var currentSelected = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.getRecipe(searchText: "s", from: 10, health: "")
    }
    
    
    
    

}



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

extension RecipeView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.filterHealthNumberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HealthFiltterCollectionCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        if currentSelected == indexPath.row{
            cell.titleLabel.backgroundColor = .red
        }else{
            cell.titleLabel.backgroundColor = .gray
        }
        presenter.configureFilterCell(cell: cell, index: indexPath.row)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        //add here
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: [])
    }
    
    
}

extension RecipeView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentSelected = indexPath.row
        healthCollectionView.reloadData()
        presenter.selectfilterCell(index: indexPath.row, searchText: "s")
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
