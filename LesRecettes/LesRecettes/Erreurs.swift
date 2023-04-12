//
//  Erreurs.swift
//  LesRecettes
//
//  Created by Tony NGOK on 11/04/2023.
//

import Foundation

// https://stevenpcurtis.medium.com/mvvm-in-swift-19ba3f87ed45
enum Erreurs: Error {
    case urlInvalide
    case pasDeDonnées
    case pasDeRéponse
    case réponseInvalide(Data?, URLResponse?)
    case erreurJSON
}
