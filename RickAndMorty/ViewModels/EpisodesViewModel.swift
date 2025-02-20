//
//  EpisodesViewModel.swift
//  RickAndMorty
//
//  Created by Adinay on 17/2/25.
//

import Foundation

class EpisodesViewModel {
    var episodes: [EpisodeModel] = []
    private var originalEpisodes: [EpisodeModel] = []
    var onDataUpdated: (() -> Void)?
    
    func fetchEpisodes() {
        NetworkService.shared.fetchEpisodes { result in
            switch result {
            case .success(let data):
                self.episodes = data
                self.originalEpisodes = data
                self.onDataUpdated?()
            case .failure(let error):
                print("Ошибка загрузки эпизодов: \(error.localizedDescription)")
            }
        }
    }
    
    func searchEpisodes(query: String) {
        if query.isEmpty {
            episodes = originalEpisodes
        } else {
            episodes = originalEpisodes.filter { $0.name.lowercased().contains(query.lowercased()) }
        }
        onDataUpdated?()
    }
}
