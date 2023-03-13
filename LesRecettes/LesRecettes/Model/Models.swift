//
//  RecipeModel.swift
//  LesRecettes
//
//  Created by Tony Ngok on 13/03/2023.
//

import Foundation

// View model: intermediate between model & view

// Model: data layer (data representation)
struct Recettes: Decodable {
    let meals: [Recette]
}

struct Recette: Decodable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
