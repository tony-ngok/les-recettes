//
//  InfosViewModel.swift
//  LesRecettes
//
//  Created by Tony NGOK on 17/03/2023.
//

import UIKit

class InfosViewModel: NSObject {
    
    var id: String = ""
    var information = RecipeInfoViewModel(img: UIImage(), nom: "", instr: "", vid: "", ingr: [String](), source: "")
    
    // get information from API, then store in the view model's local variable
    func obtenir() {
        guard let url = URL(string: apiUneRecette+id) else {
            return
        }
        if let données = try? Data(contentsOf: url) {
            if let inf = try? JSONDecoder().decode(Infos.self, from: données) {
                let i = inf.meals[0]
                
                guard let urlImg = URL(string: i.strMealThumb) else {
                    return
                }
                if let donnéeImg = try? Data(contentsOf: urlImg) {
                    let img = UIImage(data: donnéeImg) ?? UIImage()
                    information.img = img
                }
                
                information.nom = i.strMeal
                information.instr = i.strInstructions
                information.vid = i.strYoutube
                information.ingr = [i.strIngredient1, i.strIngredient2, i.strIngredient3, i.strIngredient4, i.strIngredient5, i.strIngredient6, i.strIngredient7, i.strIngredient8, i.strIngredient9, i.strIngredient10, i.strIngredient11, i.strIngredient12, i.strIngredient13, i.strIngredient14, i.strIngredient15, i.strIngredient16, i.strIngredient17, i.strIngredient18, i.strIngredient19, i.strIngredient20]
                information.source = i.strSource
            }
        }
    }
}
