//
//  Repo.swift
//  LesRecettes
//
//  Created by Tony NGOK on 11/04/2023.
//

import Foundation

// https://blog.devgenius.io/data-repository-layer-in-ios-mvvm-562541b46f91
protocol Repo {
    
    func rechercher(finir: @escaping (Result<[Recette], Error>) -> Void)
    
}
