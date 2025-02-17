//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Adinay on 16/2/25.
//

import Foundation

struct CharacterResponse: Codable {
    let results: [CharacterModel]
}

struct CharacterModel: Codable {
    let name : String?
    let gender: String
    let species: String
    let location: CharacterLocation
    let image: String?
}

struct CharacterLocation: Codable {
    let name: String
}
