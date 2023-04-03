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
    
    var modèle = [Recette]() // initialise view model
    var idActuelle = ""
    
    // View: present data in user interface
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modèle.count // # of cells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellule = tableau.dequeueReusableCell(withReuseIdentifier: RecipeCell.id, for: indexPath) as! RecipeCell
        cellule.mod = modèle.unModèle(at: indexPath)
        return cellule
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.idActuelle = modèle.unModèle(at: indexPath).id
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
        initLeModèle()
    }
    
    func initLeTableau() {
        tableau.dataSource = self
        tableau.delegate = self
        tableau.register(RecipeCell.nib, forCellWithReuseIdentifier: RecipeCell.id)
    }
    
    func initLeModèle() {
        // run search on non-main thread
        self.modèle.rechercher()
        
        // run main-thread afterwards
        DispatchQueue.main.async {
            self.tableau.reloadData()
        }
    }
    
}
