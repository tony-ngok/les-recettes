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
                information.vid = i.strYoutube ?? ""
                
                let j1 = i.strIngredient1 ?? ""
                let j2 = i.strIngredient2 ?? ""
                let j3 = i.strIngredient3 ?? ""
                let j4 = i.strIngredient4 ?? ""
                let j5 = i.strIngredient5 ?? ""
                let j6 = i.strIngredient6 ?? ""
                let j7 = i.strIngredient7 ?? ""
                let j8 = i.strIngredient8 ?? ""
                let j9 = i.strIngredient9 ?? ""
                let j10 = i.strIngredient10 ?? ""
                let j11 = i.strIngredient11 ?? ""
                let j12 = i.strIngredient12 ?? ""
                let j13 = i.strIngredient13 ?? ""
                let j14 = i.strIngredient14 ?? ""
                let j15 = i.strIngredient15 ?? ""
                let j16 = i.strIngredient16 ?? ""
                let j17 = i.strIngredient17 ?? ""
                let j18 = i.strIngredient18 ?? ""
                let j19 = i.strIngredient19 ?? ""
                let j20 = i.strIngredient20 ?? ""
                information.ingr = [j1, j2, j3, j4, j5, j6, j7, j8, j9, j10, j11, j12, j13, j14, j15, j16, j17, j18, j19, j20]
                
                information.source = i.strSource ?? ""
            }
        }
    }
}
