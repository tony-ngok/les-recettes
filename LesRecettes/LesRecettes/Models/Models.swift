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

struct InfoDeRecette: Decodable {
    let strMeal: String
    let strMealThumb: String
    let strInstructions: String
    let strYoutube: String?
    let strSource: String?
    
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
}

struct Infos: Decodable {
    let meals: [InfoDeRecette]
}
