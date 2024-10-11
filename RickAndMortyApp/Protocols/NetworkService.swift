//
//  NetworkService.swift
//  RickAndMortyApp
//
//  Created by Diego Vazquez Sanchez on 10/10/24.
//

import Foundation

protocol NetworkService {
    func fetchCharacters(completion: @escaping (Result<Characters, Error>) -> Void)
}
