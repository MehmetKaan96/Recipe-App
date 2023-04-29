//
//  CategoryListViewController.swift
//  Recipe App
//
//  Created by Mehmet Kaan on 22.04.2023.
//

import UIKit

class CategoryListViewController: UIViewController {
    let cvm = MealCategoryViewModel()
    var categories = [MealCategory]()
    var categoryImageUrls = [URL]()
    
    @IBOutlet weak var categoryListCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        categoryListCollectionView.dataSource = self
        configureOutline()
        // Do any additional setup after loading the view.
        getCategories()
    }
    

    func getCategories() {
        cvm.getAllCategories { [weak self] categories, error in
            guard let self = self else { return }
            
            if let error = error {
                print(error.localizedDescription)
            }
            if let categories = categories {
                self.categories = categories
                
                for category in self.categories {
                    if let imageUrl = URL(string: category.strCategoryThumb) {
                        self.categoryImageUrls.append(imageUrl)
                    }
                }
                DispatchQueue.main.async {
                    self.categoryListCollectionView.reloadData()
                }
            }
        }
    }

    func configureOutline() {
        self.categoryListCollectionView.layer.borderColor = UIColor.black.cgColor
        self.categoryListCollectionView.layer.borderWidth = 2.5
        self.categoryListCollectionView.layer.cornerRadius = 10
    }

}
