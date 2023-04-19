//
//  MealDBAPI.swift
//  Recipe App
//
//  Created by Mehmet Kaan on 19.04.2023.
//

import Foundation

struct MealDBAPI{
    static let shared = MealDBAPI()
    
    private init() {
        
    }
    
    func fetchMeals(completion: @escaping([Meal]?, Error?) -> Void) {
        let urlString = URL(string: Constants.endpoint + Constants.searchAll)
        
        if let url = urlString {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(nil,error)
                    return
                }
                
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(Meals.self, from: data)
//                        print(decodedData.meals)
                        completion(decodedData.meals,nil)
                        return
                    } catch {
                        print("Error")
                    }
                }
            }.resume()
        }
                            
    }
    func fetchCategories(completion: @escaping([MealCategory]? , Error?) -> Void) {
        let urlString = URL(string: Constants.endpoint + Constants.category)
        
        if let url = urlString {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(nil, error)
                    return
                }
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(MealCategories.self, from: data)
                        completion(decodedData.categories,nil)
                    } catch  {
                        print("error")
                    }
                }
            }.resume()
        }
    }
}
