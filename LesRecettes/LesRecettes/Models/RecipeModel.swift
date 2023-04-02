//
//  RecipeModel.swift
//  LesRecettes
//
//  Created by Tony Ngok on 13/03/2023.
//

import Foundation

// Model: data layer (data representation)
struct Recette: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
