//
//  LocationsViewModel.swift
//  RickAndMorty
//
//  Created by Adinay on 17/2/25.
//

import Foundation

class LocationsViewModel {
    var locations: [LocationModel] = []
    private var originalLocations: [LocationModel] = []
    var onDataUpdated: (() -> Void)?
    
    func fetchLocations() {
        NetworkService.shared.fetchLocations { result in
            switch result {
            case .success(let data):
                self.locations = data
                self.originalLocations = data
                self.onDataUpdated?()
            case .failure(let error):
                print("Ошибка загрузки локаций: \(error.localizedDescription)")
            }
        }
    }
    
    func searchLocations(query: String) {
        if query.isEmpty {
            locations = originalLocations
        } else {
            locations = originalLocations.filter { $0.name.lowercased().contains(query.lowercased()) }
        }
        onDataUpdated?()
    }
}
