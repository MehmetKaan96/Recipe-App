//
//  MealCategoryViewModel.swift
//  Recipe App
//
//  Created by Mehmet Kaan on 19.04.2023.
//

import Foundation

class MealCategoryViewModel {
    
    var categories : [MealCategory]?
    
    func getAllCategories(completion: @escaping([MealCategory]? , Error?) -> Void) {
        MealDBAPI.shared.fetchCategories { categories, error in
            if let error = error {
                completion(nil,error)
                return
            }
            if let categories = categories {
                self.categories = categories
                completion(self.categories, nil)
            }
        }
    }
}
