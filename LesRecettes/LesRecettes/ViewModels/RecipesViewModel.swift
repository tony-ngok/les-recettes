//
//  RecipesViewModel.swift
//  LesRecettes
//
//  Created by Tony Ngok on 16/03/2023.
//

import UIKit

let apiRecettes = "https://www.themealdb.com/api/json/v1/1/filter.php?a=Italian"

// View model: intermediate between model & view
// responsable for getting data from internet & displaying data
class RecipesViewModel: NSObject {
    
    var cellules = [Recette]()
    
    // get a list of recipes
    // @escaping: either get list of models (success) or error (failure)
    func rechercher(finir: @escaping (Result<[Recette], Error>) -> Void) {
//        guard let url = URL(string: apiRecettes) else {
//            return
//        }
//        if let données = try? Data(contentsOf: url) {
//            if let r = try? JSONDecoder().decode(Recettes.self, from: données) {
//                for rc in r.meals {
//                    guard let urlImg = URL(string: rc.strMealThumb) else {
//                        return
//                    }
//                    if let donnéeImg = try? Data(contentsOf: urlImg) {
//                        let img = UIImage(data: donnéeImg) ?? UIImage()
//                        cellules.append(RecipeCellViewModel(img: img, nom: rc.strMeal, id: rc.idMeal))
//                    }
//                }
//            }
//        }
        // handel HTTP request: if success, populate data
        HTTPManager().GET(de: apiRecettes, finir: { [self] résultat in
            switch résultat {
            case .failure(let erreur):
                print("Failure:", erreur)
            case .success(let données):
                do {
                    let d = try JSONDecoder().decode([Recette].self, from: données)
                    self.cellules = d // populate data
                    finir(.success(d))
                } catch {
                    print("JSON decoder error")
                }
            }
        })
    }
    
    func unModèle(at indexPath: IndexPath) -> Recette {
        return cellules[indexPath.row]
    }
    
}
