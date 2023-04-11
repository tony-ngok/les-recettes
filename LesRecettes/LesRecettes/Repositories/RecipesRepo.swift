//
//  RecipesRepo.swift
//  LesRecettes
//
//  Created by Tony NGOK on 11/04/2023.
//

import Foundation

enum ErreurJSON: Error {
    case erreur
}

let apiRecettes = "https://www.themealdb.com/api/json/v1/1/filter.php?a=Italian"

// Repository: handle network requests
// direct communicate with network layer (HTTP manager) to fetch data
class RecipesRepo {
    
    // get a list of recipes
    // @escaping: either get list of models (success) or error (failure)
    func rechercher(finir: @escaping (Result<[Recette], Error>) -> Void) {
        // handel HTTP request: if success, retrieve data
        HTTPManager().GET(de: apiRecettes, finir: { résultat in
            switch résultat {
            case .failure(let erreur):
                print("Failure:", erreur)
                finir(.failure(erreur))
            case .success(let données):
                do {
                    let d = try JSONDecoder().decode(Recettes.self, from: données)
                    finir(.success(d.meals)) // retrieve data
                } catch {
                    print("JSON decoder error")
                    finir(.failure(ErreurJSON.erreur))
                }
            }
        })
    }
    
}
