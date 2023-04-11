//
//  RecipeCell.swift
//  LesRecettes
//
//  Created by Tony Ngok on 16/03/2023.
//

import UIKit

class RecipeCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nom: UILabel!
    
    static var id: String {
        return String(describing: self)
    }
    static var nib: UINib {
        return UINib(nibName: id, bundle: nil)
    }
    
    // pseudo-initialiser: «initialise» class w/ cell view model
    var mod: Recette? {
        didSet {
            nom.text = self.mod?.strMeal
            
            img.image = UIImage()
            guard let urlImg = URL(string: self.mod?.strMealThumb ?? "") else {
                return
            }
            if let donnéeImg = try? Data(contentsOf: urlImg) {
                let img = UIImage(data: donnéeImg) ?? UIImage()
                self.img.image = img
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initialiser()
    }
    
    func initialiser() {
        preservesSuperviewLayoutMargins = false
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        img.image = nil
        nom.text = nil
    }
    
}
