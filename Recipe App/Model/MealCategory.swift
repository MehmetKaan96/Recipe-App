//
//  MealCategory.swift
//  Recipe App
//
//  Created by Mehmet Kaan on 19.04.2023.
//

import Foundation

struct MealCategory: Codable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String

    enum CodingKeys: String, CodingKey {
        case idCategory
        case strCategory
        case strCategoryThumb
        case strCategoryDescription
    }
}

struct MealCategories: Codable {
    let categories: [MealCategory]
}
