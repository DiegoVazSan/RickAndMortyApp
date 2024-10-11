//
//  ContentView.swift
//  RickAndMortyApp
//
//  Created by Diego Vazquez Sanchez on 10/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CharacterListView(viewModel: CharacterViewModel(networkService: NWServiceManager()))
    }
}

#Preview {
    ContentView()
}
