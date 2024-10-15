//
//  CharacterListView.swift
//  RickAndMortyApp
//
//  Created by Diego Vazquez Sanchez on 10/10/24.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject var viewModel: CharacterViewModel

    var body: some View {
        NavigationView {
                List(viewModel.characters, id: \.id) { character in
                    HStack {
                        RMImage(imageUrl: character.image)
                        Text(character.name)
                            .font(.title)
                            .bold()
                    }
                    .listRowBackground(Color.red)
                    .listRowSeparator(.hidden)
                }
                .navigationTitle("Characters")
                .onAppear {
                    viewModel.fetchCharacters()
                }
            
        }
    }
}
