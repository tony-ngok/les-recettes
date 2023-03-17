//
//  RecipeCellViewModel.swift
//  LesRecettes
//
//  Created by Tony Ngok on 16/03/2023.
//

import Foundation
import UIKit

// View model: intermediate between model & view
struct RecipeCellViewModel {
    var img: UIImage
    var nom: String
    var id: String
}

struct RecipeInfoViewModel {
    var img: UIImage
    var nom: String
    var instr: String
    var vid: String
    var ingr: [String]
    var source: String
}
