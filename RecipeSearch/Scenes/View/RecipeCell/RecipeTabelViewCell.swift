//
//  RecipeTabelViewCell.swift
//  RecipeSearch
//
//  Created by Admin on 19/11/2022.
//

import UIKit

class RecipeTabelViewCell: UITableViewCell,Reuseable {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTittleLabel: UILabel!
    @IBOutlet weak var RecipeSourceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Public Functions
    
    func configure(viewModel: Hits){
        recipeTittleLabel.text = viewModel.recipe.label
        RecipeSourceLabel.text = viewModel.recipe.source
//        if let url = URL(string: viewModel.recipe.image){
//            recipeImage.kf.setImage(with:url)
//        }
    }
    
}
