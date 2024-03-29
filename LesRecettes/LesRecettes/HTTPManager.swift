//
//  NetSingleton.swift
//  LesRecettes
//
//  Created by Tony NGOK on 02/04/2023.
//

import Foundation

// HTTP manager: singleton to handle network requests
class HTTPManager {
    
    // https://www.donnywals.com/what-is-escaping-in-swift/
    // @escaping: closure (returning void) passed in executes once data request finishes
    // Result<Data, Error>: value of type Data on success, value of type Error on failure
    func GET(de: String, finir: @escaping (Result<Data, Error>) -> Void) {
        // step 1: check whether URL valid
        guard let url = URL(string: de) else {
            print("ERROR: Invalid URL")
            finir(.failure(Erreurs.urlInvalide))
            return
        }
        
        // step 2: handel data request from URL
        // https://developer.apple.com/documentation/foundation/urlsession/1407613-datatask
        let tâche = URLSession.shared.dataTask(with: url) { (données, réponse, erreur) in
            // step 2a: handel (generic) GET request error
            guard erreur == nil else {
                print("ERROR: Failed to call GET")
                finir(.failure(erreur!))
                return
            }
            
            // step 2b: handel error when retrieving data
            // https://stackoverflow.com/questions/70777570/guard-let-foo-foo-vs-guard-foo-nil-in-swift
            guard let d = données else {
                print("ERROR: No data obtained")
                finir(.failure(Erreurs.pasDeDonnées))
                return
            }
            
            // step 2c: handel failing HTTP response
            guard let r = réponse as? HTTPURLResponse else {
                print("ERROR: Failed to get HTTP response")
                finir(.failure(Erreurs.pasDeRéponse))
                return
            }
            if ((r.statusCode < 200) || (r.statusCode >= 300)) {
                print("ERROR", r.statusCode)
                finir(.failure(Erreurs.réponseInvalide(d, r)))
                return
            }
            
            finir(.success(d)) // succeed
        }
        tâche.resume() // resume task if suspended
    }
    
}
