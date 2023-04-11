//
//  InfosModel.swift
//  LesRecettes
//
//  Created by Tony NGOK on 02/04/2023.
//

import Foundation

struct Infos: Decodable {
    let meals: [InfoDeRecette]
}
