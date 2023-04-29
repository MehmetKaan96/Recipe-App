//
//  MealViewModel.swift
//  Recipe App
//
//  Created by Mehmet Kaan on 19.04.2023.
//

import Foundation

class MealViewModel {
    var meals: [Meal]?
    var randomMeal : Meal?
    
    func loadMeals(completion: @escaping ([Meal]?, Error?) -> Void) {
        MealDBAPI.shared.fetchMeals { [weak self ] meals, error in
            if let error = error {
                completion(nil,error)
                return
            }
            if let meals = meals {
                self?.meals = meals.sorted {$0.strMeal < $1.strMeal }
//                print(self?.meals)
                completion(meals,nil)
            }
        }
    }
    
    func loadRandomMeal(completion: @escaping (Meal?, Error?) -> Void){
        MealDBAPI.shared.fetchRandomMeal { meal, error in
            if let error = error {
                completion(nil,error)
                return
            }
            if let meal = meal {
                self.randomMeal = meal
                completion(self.randomMeal,nil)
            }
        }
    }
}
