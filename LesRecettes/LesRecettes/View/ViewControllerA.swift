//
//  ViewController.swift
//  LesRecettes
//
//  Created by Tony Ngok on 06/03/2023.
//

// MVVM Tutorial: https://johncodeos.com/how-to-implement-mvvm-pattern-with-swift-in-ios/

import UIKit

// Controller: tie view & model together
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var tableau: UICollectionView!
    var modèle = RecipesViewModel()
    
    // View: present data in user interface
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modèle.cellules.count // # of cells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellule = tableau.dequeueReusableCell(withReuseIdentifier: RecipeCell.id, for: indexPath) as! RecipeCell
        
//        // https://stackoverflow.com/questions/23801418/uicollectionview-adding-image-to-a-cell
//        let img: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 172, height: 258))
//
//        guard let urlImg = URL(string: résultats[indexPath.row].strMealThumb) else {
//            return cellule
//        }
//        if let donnéeImg = try? Data(contentsOf: urlImg) {
//            img.image = UIImage(data: donnéeImg) ?? UIImage()
//        }
//
//        let titre: UILabel = UILabel(frame: CGRect(x: 0, y: 200, width: 172, height: 58))
//        titre.backgroundColor = UIColor.darkGray
//        titre.alpha = 0.85
//        titre.text = résultats[indexPath.row].strMeal
//        titre.textColor = UIColor.white
//
//        // https://www.folkstalk.com/2022/10/uilabel-make-bold-with-code-examples.html
//        titre.font = UIFont.boldSystemFont(ofSize: 17)
//
//        titre.numberOfLines = 2
//        titre.textAlignment = NSTextAlignment.center
//        img.addSubview(titre)
//
//        cellule.addSubview(img)
        cellule.mod = modèle.unModèle(at: indexPath)
        return cellule
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initLeTableau()
        initLeModèle()
    }
    
    func initLeTableau() {
        tableau.dataSource = self
        tableau.delegate = self
        tableau.register(RecipeCell.nib, forCellWithReuseIdentifier: RecipeCell.id)
    }
    
    func initLeModèle() {
        modèle.rechercher()
        tableau.reloadData()
    }
    
}
