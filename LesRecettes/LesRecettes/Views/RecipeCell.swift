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
    var mod: RecipeCellViewModel? {
        didSet {
            img.image = self.mod?.img
            nom.text = self.mod?.nom
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
