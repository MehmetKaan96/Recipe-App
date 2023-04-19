//
//  ExtensionViewController.swift
//  Recipe App
//
//  Created by Mehmet Kaan on 19.04.2023.
//

import UIKit

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mealCollectionView {
            return meals.count
        } else {
            return categories.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mealCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MealsCell", for: indexPath) as! MealCollectionViewCell
            
            let imageUrl = imageUrls[indexPath.row]
            loadImage(for: cell, url: imageUrl)
            
            cell.categoryLabel.text = meals[indexPath.row].strCategory
            cell.mealNameLabel.text = meals[indexPath.row].strMeal
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCollectionViewCell
            
            let imageUrl = categoryImageUrls[indexPath.row]
            loadCategoryImage(for: cell, url: imageUrl)
            cell.categoryNameLabel.text = categories[indexPath.row].strCategory
            return cell
        }
    }
    
    func loadImage(for cell: MealCollectionViewCell, url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                cell.mealImageView.image = UIImage(data: data)
            }
        }.resume()
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
