//
//  RecipesViewModel.swift
//  LesRecettes
//
//  Created by Tony Ngok on 16/03/2023.
//

import UIKit

// View model: intermediate between model & view;
// responsable for getting data from internet & displaying data;
// executes use case
class RecipesViewModel: NSObject {
    
    let repo = RecipesRepo()
    var cellules = [Recette]()
    
    func obtenir() {
        repo.rechercher(finir: { résultat in
            switch résultat {
            case .failure(_):
                print("Cannot get recipes.")
            case .success(let données):
                self.cellules = données // if request succeed, populate data
            }
        })
    }
    
}
