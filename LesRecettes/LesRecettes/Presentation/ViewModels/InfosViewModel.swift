//
//  InfosViewModel.swift
//  LesRecettes
//
//  Created by Tony NGOK on 17/03/2023.
//

import UIKit

let apiUneRecette = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="

class InfosViewModel: NSObject {
    
    var id: String = ""
    var information = InfoDeRecette(strMeal: "", strMealThumb: "", strInstructions: "", strYoutube: "", strSource: "", strIngredient1: "", strIngredient2: "", strIngredient3: "", strIngredient4: "", strIngredient5: "", strIngredient6: "", strIngredient7: "", strIngredient8: "", strIngredient9: "", strIngredient10: "", strIngredient11: "", strIngredient12: "", strIngredient13: "", strIngredient14: "", strIngredient15: "", strIngredient16: "", strIngredient17: "", strIngredient18: "", strIngredient19: "", strIngredient20: "")
    
    func obtenir(finir: @escaping (Result<InfoDeRecette, Error>) -> Void) {
        HTTPManager().GET(de: apiUneRecette+self.id, finir: { [self] résultat in
            switch résultat{
            case .failure(let erreur):
                print("Failure:", erreur)
            case .success(let données):
                do {
                    let d = try JSONDecoder().decode(Infos.self, from: données)
                    self.information = d.meals[0] // populate data
                    finir(.success(d.meals[0]))
                } catch {
                    print("JSON decoder error")
                }
            }
        })
    }
    
}
