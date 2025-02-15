//
//  EpisodeModel.swift
//  RickAndMorty
//
//  Created by Adinay on 16/2/25.
//

import Foundation

struct EpisodeResponse: Codable {
    let results: [EpisodeModel]
}

struct EpisodeModel: Codable {
    let name: String
    let air_date: String
    let episode: String
}
