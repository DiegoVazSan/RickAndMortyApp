//
//  RickAndMortyService.swift
//  RickAndMortyApp
//
//  Created by Diego Vazquez Sanchez on 10/10/24.
//

import Alamofire

class NWServiceManager: NetworkService {
    func fetchCharacters(completion: @escaping (Result<Characters, Error>) -> Void) {
        let urlString = "https://rickandmortyapi.com/api/character"
        
        AF.request(urlString).responseDecodable(of: Characters.self) { response in
            switch response.result {
            case .success(let characters):
                completion(.success(characters))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

