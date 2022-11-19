//
//  RecipeView+CollectionView.swift
//  RecipeSearch
//
//  Created by Admin on 19/11/2022.
//

import UIKit


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
        presenter.selectfilterCell(index: indexPath.row, searchText: searchText)
    }
}
