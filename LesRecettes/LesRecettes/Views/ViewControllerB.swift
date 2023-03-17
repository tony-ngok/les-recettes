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
        initialisation()
    }
    
    func initialisation() {
        m.id = idRecette
        m.obtenir()
        
        img.image = m.information.img
        nom.text = m.information.nom
        instr.text = m.information.instr
        lien.text = m.information.vid
        source.text = m.information.source
        
        // https://www.donnywals.com/how-to-filter-an-array-in-swift/
        let filtré = m.information.ingr.filter { i in
            return i.count > 0
        }
        
        // https://www.programiz.com/swift-programming/library/array/joined
        ingr.text = filtré.joined(separator: "\n")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
