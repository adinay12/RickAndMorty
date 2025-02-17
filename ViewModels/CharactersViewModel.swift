//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Adinay on 17/2/25.
//

class CharactersViewModel {
    var characters: [CharacterModel] = []
    private var originalCharacters: [CharacterModel] = []
    var onDataUpdated: (() -> Void)?
    
    func fetchCharacters() {
        NetworkService.shared.fetchCharacters { result in
            switch result {
            case .success(let data):
                self.characters = data
                self.originalCharacters = data
                self.onDataUpdated?()
            case .failure(let error):
                print("Ошибка загрузки персонажей: \(error.localizedDescription)")
            }
        }
    }
    
    func searchCharacters(query: String) {
        if query.isEmpty {
            characters = originalCharacters
        } else {
            characters = originalCharacters.filter { $0.name!.lowercased().contains(query.lowercased()) }
        }
        onDataUpdated?()
    }
}
