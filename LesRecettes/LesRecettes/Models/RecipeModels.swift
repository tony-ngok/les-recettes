//
//  RecipeModel.swift
//  LesRecettes
//
//  Created by Tony Ngok on 13/03/2023.
//

import Foundation

let apiRecettes = "https://www.themealdb.com/api/json/v1/1/filter.php?a=Italian"
let apiUneRecette = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
var résultats = [Recette]()

// Model: data layer (data representation)
struct Recette: Decodable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

struct Recettes: Decodable {
    let meals: [Recette]
}
