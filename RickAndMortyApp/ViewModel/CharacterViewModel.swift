//
//  CharacterViewModel.swift
//  RickAndMortyApp
//
//  Created by Diego Vazquez Sanchez on 10/10/24.
//

import Combine
import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var errorMessage: String?

    private var networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
        fetchCharacters()
    }

    func fetchCharacters() {
        networkService.fetchCharacters { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let characters):
                    self?.characters = characters.results
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

