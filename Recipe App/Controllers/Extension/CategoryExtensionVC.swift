//
//  CategoryExtensionVC.swift
//  Recipe App
//
//  Created by Mehmet Kaan on 22.04.2023.
//

import Foundation
import UIKit

extension CategoryListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
        
        let imageUrl = categoryImageUrls[indexPath.row]
        loadCategoryImage(for: cell, url: imageUrl)
        cell.categoryNameLabel.text = categories[indexPath.row].strCategory
        return cell
        
    }
    
    func loadCategoryImage(for cell: CategoryCollectionViewCell, url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                cell.categoryImageView.image = UIImage(data: data)
            }
        }.resume()
    }

    
}
