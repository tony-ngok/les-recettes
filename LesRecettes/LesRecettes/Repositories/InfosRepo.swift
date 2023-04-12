//
//  InfosRepo.swift
//  LesRecettes
//
//  Created by Tony NGOK on 11/04/2023.
//

import Foundation

class InfosRepo {
    
    private let apiUneRecette = "https://www.themealdb.com/api/json/v1/1/lookup.php?i="
    
    func rechercher(id: String, finir: @escaping (Result<InfoDeRecette, Error>) -> Void) {
        HTTPManager().GET(de: apiUneRecette+id, finir: { résultat in
            switch résultat{
            case .failure(let erreur):
                print("Failure:", erreur)
                finir(.failure(erreur))
            case .success(let données):
                do {
                    let d = try JSONDecoder().decode(Infos.self, from: données)
                    finir(.success(d.meals[0]))
                } catch {
                    print("JSON decoder error")
                    finir(.failure(Erreurs.erreurJSON))
                }
            }
        })
    }
    
}
