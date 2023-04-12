//
//  ViewControllerB.swift
//  LesRecettes
//
//  Created by Tony Ngok on 16/03/2023.
//

import UIKit

class ViewControllerB: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nom: UILabel!
    @IBOutlet weak var instr: UILabel!
    @IBOutlet weak var lien: UILabel!
    @IBOutlet weak var ingr: UILabel!
    @IBOutlet weak var source: UILabel!
    
    var idRecette = ""
    var m = InfosViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Recipe ID: \(idRecette)")
        m.id = idRecette
        m.obtenir(finir: { réussi in
            switch réussi {
            case true:
                DispatchQueue.main.async {
                    self.initialisation()
                    
                    // https://stackoverflow.com/questions/33658521/how-to-make-a-uilabel-clickable
                    let leLien = UITapGestureRecognizer(target: self, action: #selector(ViewControllerB.ouvrirLeLien))
                    self.lien.addGestureRecognizer(leLien)
                    let leSource = UITapGestureRecognizer(target: self, action: #selector(ViewControllerB.ouvrirLeSource))
                    self.source.addGestureRecognizer(leSource)
                }
            case false:
                print("Cannot get recipe info.")
            }
            
        })
    }
    
    func initialisation() {
        let info = m.information
        
        nom.text = info.strMeal
        instr.text = info.strInstructions
        lien.text = info.strYoutube
        source.text = info.strSource
        
        img.image = UIImage()
        guard let urlImg = URL(string: info.strMealThumb) else {
            return
        }
        if let donnéeImg = try? Data(contentsOf: urlImg) {
            let img = UIImage(data: donnéeImg) ?? UIImage()
            self.img.image = img
        }
        
        // ingredients
        let j1 = info.strIngredient1 ?? ""
        let j2 = info.strIngredient2 ?? ""
        let j3 = info.strIngredient3 ?? ""
        let j4 = info.strIngredient4 ?? ""
        let j5 = info.strIngredient5 ?? ""
        let j6 = info.strIngredient6 ?? ""
        let j7 = info.strIngredient7 ?? ""
        let j8 = info.strIngredient8 ?? ""
        let j9 = info.strIngredient9 ?? ""
        let j10 = info.strIngredient10 ?? ""
        let j11 = info.strIngredient11 ?? ""
        let j12 = info.strIngredient12 ?? ""
        let j13 = info.strIngredient13 ?? ""
        let j14 = info.strIngredient14 ?? ""
        let j15 = info.strIngredient15 ?? ""
        let j16 = info.strIngredient16 ?? ""
        let j17 = info.strIngredient17 ?? ""
        let j18 = info.strIngredient18 ?? ""
        let j19 = info.strIngredient19 ?? ""
        let j20 = info.strIngredient20 ?? ""
        let j = [j1, j2, j3, j4, j5, j6, j7, j8, j9, j10, j11, j12, j13, j14, j15, j16, j17, j18, j19, j20]
        
        // https://www.donnywals.com/how-to-filter-an-array-in-swift/
        let filtré = j.filter { i in
            return i.count > 0
        }

        // https://www.programiz.com/swift-programming/library/array/joined
        ingr.text = filtré.joined(separator: "\n")
    }
    
    // https://stackoverflow.com/questions/33658521/how-to-make-a-uilabel-clickable
    @objc func ouvrirLeLien(sender: UITapGestureRecognizer) {
        let l = lien.text ?? ""
        if (l != "") {
            // https://stackoverflow.com/questions/41542409/how-to-open-youtube-app-with-youtube-id-on-a-button-click-in-ios
            if let youtubeURL = URL(string: l) {
                UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil) // redirect through safari
            }
        }
    }
    
    @objc func ouvrirLeSource(sender: UITapGestureRecognizer) {
        let l = source.text ?? ""
        if (l != "") {
            // https://stackoverflow.com/questions/45562662/how-can-i-use-string-substring-in-swift-4-substringto-is-deprecated-pleas
            if let youtubeURL = URL(string: "youtube://\(l.suffix(11))"), UIApplication.shared.canOpenURL(youtubeURL) {
                UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil) // redirect to app
            } else if let url = URL(string: l) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }

}
