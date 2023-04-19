//
//  ViewController.swift
//  Recipe App
//
//  Created by Mehmet Kaan on 19.04.2023.
//

import UIKit

class ViewController: UIViewController {
    let vm = MealViewModel()
    let cvm = MealCategoryViewModel()
    var meals = [Meal]()
    var categories = [MealCategory]()
    var imageUrls = [URL]()
    var categoryImageUrls = [URL]()
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var mealCollectionView: UICollectionView!
    func configureNavBarRightButton() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 32, height: 38))
        imageView.image = UIImage(named: "Profile")
        imageView.isUserInteractionEnabled = true
        let imageBarButtonItem = UIBarButtonItem(customView: imageView)
        
        navigationItem.rightBarButtonItem = imageBarButtonItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mealCollectionView.dataSource = self
        categoryCollectionView.dataSource = self
        
        
        configureNavBarRightButton()
        self.mealCollectionView.layer.borderColor = UIColor(named: "BackgroundColor")?.cgColor
        self.mealCollectionView.layer.borderWidth = 2.5
        
        vm.loadMeals { [weak self] meal, error in
            guard let self = self else { return }
            if let error = error {
                print(error)
            }
            if let meal = meal {
                self.meals = meal
                
                for meal in self.meals {
                    if let imageUrl = URL(string: meal.strMealThumb) {
                        self.imageUrls.append(imageUrl)
                        }
                }
                DispatchQueue.main.async {
                    self.mealCollectionView.reloadData()
                }
            }
        }
        
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
                    self.categoryCollectionView.reloadData()
                }
            }
        }
    }

}

