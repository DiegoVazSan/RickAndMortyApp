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
        ZStack {
            Color.mainBackground.ignoresSafeArea(.all)
            
            List(viewModel.characters, id: \.id) { character in
                HStack {
                    RMImage(imageUrl: character.image)
                    Text(character.name)
                        .font(.title)
                        .bold()
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
            .background(Color.clear)
            .navigationTitle("Characters")
            .onAppear {
                if viewModel.characters.isEmpty {
                    viewModel.fetchCharacters()
                }
            }
        }
    }
}
