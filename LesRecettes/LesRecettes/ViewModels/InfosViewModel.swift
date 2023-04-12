//
//  InfosViewModel.swift
//  LesRecettes
//
//  Created by Tony NGOK on 17/03/2023.
//

import UIKit

class InfosViewModel: NSObject {
    
    var id: String = ""
    private let repo = InfosRepo()
    var information = InfoDeRecette(strMeal: "", strMealThumb: "", strInstructions: "", strYoutube: "", strSource: "", strIngredient1: "", strIngredient2: "", strIngredient3: "", strIngredient4: "", strIngredient5: "", strIngredient6: "", strIngredient7: "", strIngredient8: "", strIngredient9: "", strIngredient10: "", strIngredient11: "", strIngredient12: "", strIngredient13: "", strIngredient14: "", strIngredient15: "", strIngredient16: "", strIngredient17: "", strIngredient18: "", strIngredient19: "", strIngredient20: "")
    
    func obtenir(finir: @escaping (Bool) -> Void) {
        repo.rechercher(id: self.id, finir: { résultat in
            switch résultat {
            case .failure(_):
                finir(false)
            case .success(let données):
                self.information = données
                finir(true)
            }
        })
    }
    
}
