//
//  ResultTabelView.swift
//  RecipeSearch
//
//  Created by Admin on 19/11/2022.
//


import UIKit

// This protocol helps inform MainTableViewController that a suggested search or product was selected.
protocol SuggestedSearch: AnyObject {
    // A suggested search was selected; inform our delegate that the selected search token was selected.
    func didSelectSuggestedSearch(text: NSAttributedString)
    
}

class ResultsTableController: UITableViewController {
    
    static let productCellIdentifier = "cellID"
    
    class func suggestedTitle(fromIndex: Int) -> String {
        return suggestedSearches[fromIndex]
    }
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceived(_:)), name: NSNotification.Name(rawValue: "addNewSearch"), object: nil)
    }
    
    // Your delegate to receive suggested search tokens.
    weak var suggestedSearchDelegate: SuggestedSearch?
    
    // MARK: - UITableViewDataSource
    
    static var suggestedSearches = searchStorge().getSearchArray()

    @objc func methodOfReceived(_ notification: NSNotification) {
        ResultsTableController.suggestedSearches = searchStorge().getSearchArray()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ResultsTableController.suggestedSearches.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return showSuggestedSearches ? NSLocalizedString("Suggested Searches", comment: "") : ""
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: ResultsTableController.productCellIdentifier)

            let suggestedtitle = NSMutableAttributedString(string: ResultsTableController.suggestedSearches[indexPath.row])
            suggestedtitle.addAttribute(NSAttributedString.Key.foregroundColor,
                                        value: UIColor.label,
                                        range: NSRange(location: 0, length: suggestedtitle.length))
            cell.textLabel?.attributedText = suggestedtitle
            
            // No detailed text or accessory for suggested searches.
            cell.detailTextLabel?.text = ""
            cell.accessoryType = .none

        return cell
    }
    
    var showSuggestedSearches: Bool = false {
        didSet {
            if oldValue != showSuggestedSearches {
                tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // We must have a delegate to respond to row selection.
        guard let suggestedSearchDelegate = suggestedSearchDelegate else { return }
            
        tableView.deselectRow(at: indexPath, animated: true)
        
            // A suggested search was selected; inform our delegate that the selected search token was selected.
          
            let suggestedtitle = NSMutableAttributedString(string: ResultsTableController.suggestedSearches[indexPath.row])
            suggestedSearchDelegate.didSelectSuggestedSearch(text: suggestedtitle)
     
    }
    
    
    // Search a search token from an input value.
    class func searchToken(tokenValue: Int) -> UISearchToken {

        let searchToken = UISearchToken(icon: nil, text: suggestedTitle(fromIndex: tokenValue))
  
        return searchToken
    }


}
