//
//  RecipeModel.swift
//  LesRecettes
//
//  Created by Tony Ngok on 13/03/2023.
//

import Foundation

let apiRecettes = "https://www.themealdb.com/api/json/v1/1/filter.php?a=Italian"
let apiUneRecette = "www.themealdb.com/api/json/v1/1/lookup.php?i="
var résultats = [Recette]()

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
