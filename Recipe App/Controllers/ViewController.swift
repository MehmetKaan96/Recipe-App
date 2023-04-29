//
//  ViewController.swift
//  Recipe App
//
//  Created by Mehmet Kaan on 19.04.2023.
//

import UIKit

class ViewController: UIViewController {
    let vm = MealViewModel()
    
    var meals = [Meal]()
    
    var imageUrls = [URL]()
    
    
    @IBOutlet weak var composeMealButton: UIButton!
    @IBOutlet weak var composeImageView: UIImageView!
    @IBOutlet weak var mealCollectionView: UICollectionView!
    
    @IBOutlet weak var composeStack: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mealCollectionView.dataSource = self
        configureNavBarRightButton()
        configureCollectionViews()
        
        getMeals()
        configure()
        
    }
    
    func getMeals() {
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
    }
    
    
    func configureNavBarRightButton() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 32, height: 38))
        imageView.image = UIImage(named: "Profile")
        imageView.isUserInteractionEnabled = true
        let imageBarButtonItem = UIBarButtonItem(customView: imageView)
        
        navigationItem.rightBarButtonItem = imageBarButtonItem
    }
    
    func configureCollectionViews() {
        self.mealCollectionView.layer.borderColor = UIColor(named: "BackgroundColor")?.cgColor
        self.mealCollectionView.layer.borderWidth = 2.5
        self.mealCollectionView.layer.cornerRadius = 10
    }
    
    func configure() {
        composeStack.layer.cornerRadius = 10
        composeMealButton.layer.borderColor = UIColor.white.cgColor
        composeMealButton.layer.borderWidth = 1
        composeMealButton.layer.cornerRadius = 20
    }
    
    func getRandom() {
        vm.loadRandomMeal { meal, error in
            
        }
    }
    @IBAction func composeButtonTapped(_ sender: UIButton) {
        print("tapped")
    }
}

