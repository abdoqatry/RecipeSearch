//
//  RecipeView.swift
//  RecipeSearch
//
//  Created by Admin on 19/11/2022.
//

import UIKit

class RecipeView: UIViewController, UISearchResultsUpdating {

    
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
    
    var searchController : UISearchController!
    
    /// The search results table view.
    var resultsTableController: ResultsTableController!
  
    var presenter: RecipesPresenterProtocol!
    let cellHeight = 140.0
    var currentSelected = -1
    var health = "All"
    var searchText = ""
    
//    let searchProtcol = searchStorge()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        searchTextSetup()
    }
    
    
    func searchTextSetup(){
        
        resultsTableController = ResultsTableController()
        resultsTableController.suggestedSearchDelegate = self // So we can be notified when a suggested search token is selected.
        searchController = UISearchController(searchResultsController: resultsTableController)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Type something here to search"
        navigationItem.searchController = searchController
        
        // Monitor when the search controller is presented and dismissed.
        searchController.delegate = self

        // Monitor when the search button is tapped, and start/end editing.
        searchController.searchBar.delegate = self
        
        
        /** Specify that this view controller determines how the search controller is presented.
            The search controller should be presented modally and match the physical size of this view controller.
        */
        definesPresentationContext = true
    }
    
    
    func setToSuggestedSearches() {
        // Show suggested searches only if we don't have a search token in the search field.
        if searchController.searchBar.searchTextField.tokens.isEmpty {
            resultsTableController.showSuggestedSearches = true
            
            // We are no longer interested in cell navigating, since we are now showing the suggested searches.
            resultsTableController.tableView.delegate = resultsTableController
        }
    }
    
    @objc func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
          print(text)
    }
    
}



extension RecipeView: SuggestedSearch {
    
    // ResultsTableController selected a suggested search, so we need to apply the search token.
    func didSelectSuggestedSearch(text: NSAttributedString) {
        if let searchField = navigationItem.searchController?.searchBar.searchTextField {
//            searchField.insertToken(token, at: 0)
            searchField.attributedText = text
            
            // Hide the suggested searches now that we have a token.
            resultsTableController.showSuggestedSearches = false
            
            // Update the search query with the newly inserted token.
            updateSearchResults(for: searchController)
        }
    }
    
}

extension RecipeView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text!.isEmpty {
            // Text is empty, show suggested searches again.
            setToSuggestedSearches()
        } else {
            resultsTableController.showSuggestedSearches = false
        }
    }
   
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // User tapped the Done button in the keyboard.
        searchController.dismiss(animated: true, completion: nil)
        //Save array to UserDefaults and add picked image url to the array
        guard let text = searchBar.text , text != "" else {
            return
        }
        searchText = text
        presenter.getRecipe(searchText: searchText, from: 10, health: health)
//        searchProtcol.saveSearch(text: text)
//        let urls = searchProtcol.getSearchArray()
//        searchProtcol.removeSearch()
        searchBar.text = ""
       
    }

}


// MARK: - UISearchControllerDelegate

extension RecipeView: UISearchControllerDelegate {
    
    //  show suggested searches.
    func presentSearchController(_ searchController: UISearchController) {
        searchController.showsSearchResultsController = true
        setToSuggestedSearches()
    }
    
//    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        let newLength: Int = searchBar.text!.count + text.count - range.length
//        let EnglishLetter = NSCharacterSet.init(charactersIn: "aqwertyuiopsdfghjklzxcvbQWERTYUIOPASDFGHJKLZXCVBNM ").inverted
//        let strValid = text.rangeOfCharacter(from: EnglishLetter) == nil
//               return (strValid && (newLength <= 40))
//
//    }
}


extension RecipeView :RecipesViewProtocol {
    func goToRecipeDetails(vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
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
