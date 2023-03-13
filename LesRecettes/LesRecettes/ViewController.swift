//
//  ViewController.swift
//  LesRecettes
//
//  Created by Tony Ngok on 06/03/2023.
//

// MVVM Tutorial: https://www.youtube.com/watch?v=qzXJckVxE4w

import UIKit

let api = "https://www.themealdb.com/api/json/v1/1/filter.php?a=Italian"

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var tableau: UICollectionView!
    
    // # of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellule = tableau.dequeueReusableCell(withReuseIdentifier: "recette", for: indexPath)
        
        // https://stackoverflow.com/questions/23801418/uicollectionview-adding-image-to-a-cell
        let img: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 172, height: 258))
//        img.image = images[indexPath.item]
        
        let titre: UILabel = UILabel(frame: CGRect(x: 0, y: 200, width: 172, height: 58))
        titre.backgroundColor = UIColor.darkGray
        titre.alpha = 0.85
        titre.text = "Good"
        titre.textColor = UIColor.white
        
        // https://www.folkstalk.com/2022/10/uilabel-make-bold-with-code-examples.html
        titre.font = UIFont.boldSystemFont(ofSize: 17)
        
        titre.numberOfLines = 2
        titre.textAlignment = NSTextAlignment.center
        img.addSubview(titre)
        
        cellule.addSubview(img)
        return cellule
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableau.dataSource = self
        tableau.delegate = self
        
    }

}
