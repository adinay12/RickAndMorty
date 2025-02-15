//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Adinay on 16/2/25.
//

import Foundation

struct CharacterResponse: Codable {
    let rusults: [CharacterModel]
}

struct CharacterModel: Codable {
    let name : String?
    let gender: String
    let species: String
    let location: String
    let image: String?
}

struct CharacterLocation: Codable {
    let name: String
}
