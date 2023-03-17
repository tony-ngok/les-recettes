//
//  RecipesViewModel.swift
//  LesRecettes
//
//  Created by Tony Ngok on 16/03/2023.
//

import UIKit

class RecipesViewModel: NSObject {
    
    var cellules = [RecipeCellViewModel]()
    
    // get a list of recipes
    func rechercher() {
        guard let url = URL(string: apiRecettes) else {
            return
        }
        if let données = try? Data(contentsOf: url) {
            if let r = try? JSONDecoder().decode(Recettes.self, from: données) {
                for rc in r.meals {
                    guard let urlImg = URL(string: rc.strMealThumb) else {
                        return
                    }
                    if let donnéeImg = try? Data(contentsOf: urlImg) {
                        let img = UIImage(data: donnéeImg) ?? UIImage()
                        cellules.append(RecipeCellViewModel(img: img, nom: rc.strMeal, id: rc.idMeal))
                    }
                }
            }
        }
    }
    
    func unModèle(at indexPath: IndexPath) -> RecipeCellViewModel {
        return cellules[indexPath.row]
    }
    
}
