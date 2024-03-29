//
//  ViewControllerA.swift
//  LesRecettes
//
//  Created by Tony Ngok on 06/03/2023.
//

// MVVM Tutorial 1: https://johncodeos.com/how-to-implement-mvvm-pattern-with-swift-in-ios
// MVVM Tutorial 2: https://stevenpcurtis.medium.com/mvvm-in-swift-19ba3f87ed45
// MVVM Tutorial 3: https://blog.devgenius.io/data-repository-layer-in-ios-mvvm-562541b46f91

import UIKit

// Controller: tie view & model together
class ViewControllerA: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var tableau: UICollectionView!
    
    var modèle = RecipesViewModel() // initialise view model
    var idActuelle = ""
    
    // View: present data in user interface
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modèle.cellules.count // # of cells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellule = tableau.dequeueReusableCell(withReuseIdentifier: RecipeCell.id, for: indexPath) as! RecipeCell
        cellule.mod = modèle.cellules[indexPath.row]
        return cellule
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.idActuelle = modèle.cellules[indexPath.row].idMeal
        self.performSegue(withIdentifier: "info", sender: self)
    }
    
    // This function is called before the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let b = segue.destination as! ViewControllerB
        b.idRecette = self.idActuelle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initLeTableau()
        
        // initialising the table view
        self.modèle.obtenir(finir: { recherché in
            switch recherché {
            case true:
                DispatchQueue.main.async {
                    self.tableau.reloadData()
                }
            case false:
                print("Cannot get recipes.")
            }
        })
    }
    
    func initLeTableau() {
        tableau.dataSource = self
        tableau.delegate = self
        tableau.register(RecipeCell.nib, forCellWithReuseIdentifier: RecipeCell.id)
    }
    
}
