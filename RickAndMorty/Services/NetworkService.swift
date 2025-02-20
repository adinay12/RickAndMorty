//
//  NetworkService.swift
//  RickAndMorty
//
//  Created by Adinay on 17/2/25.
//

import Foundation
import Alamofire

class NetworkService {
    static let shared = NetworkService()
    private let baseURL = "https://rickandmortyapi.com/api"
    
    func fetchCharacters(completion: @escaping (Result<[CharacterModel], Error>) -> Void) {
        let url = "\(baseURL)/character"
        AF.request(url).validate().responseDecodable(of: CharacterResponse.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchLocations(completion: @escaping (Result<[LocationModel], Error>) -> Void) {
        let url = "\(baseURL)/location"
        AF.request(url).validate().responseDecodable(of: LocationResponse.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchEpisodes(completion: @escaping (Result<[EpisodeModel], Error>) -> Void) {
        let url = "\(baseURL)/episode"
        AF.request(url).validate().responseDecodable(of: EpisodeResponse.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data.results))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
