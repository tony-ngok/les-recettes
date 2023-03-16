//
//  ViewControllerA.swift
//  LesRecettes
//
//  Created by Tony Ngok on 06/03/2023.
//

// MVVM Tutorial: https://johncodeos.com/how-to-implement-mvvm-pattern-with-swift-in-ios/

import UIKit

// Controller: tie view & model together
class ViewControllerA: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var tableau: UICollectionView!
    var modèle = RecipesViewModel()
    
    // View: present data in user interface
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modèle.cellules.count // # of cells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellule = tableau.dequeueReusableCell(withReuseIdentifier: RecipeCell.id, for: indexPath) as! RecipeCell
        cellule.mod = modèle.unModèle(at: indexPath)
        return cellule
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "info", sender: self)
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
