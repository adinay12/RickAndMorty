//
//  LocationModel.swift
//  RickAndMorty
//
//  Created by Adinay on 16/2/25.
//

import Foundation

struct LocationResponse: Codable {
    let results: [LocationModel]
}

struct LocationModel: Codable {
    let name: String
    let type: String
    let dimension: String
}
