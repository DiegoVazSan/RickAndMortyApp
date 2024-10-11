//
//  CharacterModel.swift
//  RickAndMortyApp
//
//  Created by Diego Vazquez Sanchez on 10/10/24.
//

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String
}

struct Characters: Codable {
    let results : [Character]
}


