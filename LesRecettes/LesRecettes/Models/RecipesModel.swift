//
//  RecipesModel.swift
//  LesRecettes
//
//  Created by Tony NGOK on 02/04/2023.
//

import Foundation

struct Recettes: Decodable {
    let meals: [Recette]
}
