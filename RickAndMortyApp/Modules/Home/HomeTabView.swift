//
//  HomeTabView.swift
//  RickAndMortyApp
//
//  Created by Diego Vazquez Sanchez on 26/10/24.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        TabView {
            
            CharacterListView(viewModel: CharacterViewModel(networkService: NWServiceManager()))
                .tabItem {
                    Label("Explora", systemImage: "magnifyingglass")
                }
            
            Text("Quiz")
                .tabItem {
                    Label("Quiz", systemImage: "questionmark.diamond.fill")
                }
            
            Text("Perfil de Usuario")
                .tabItem {
                    Label("Perfil de Usuario", systemImage: "person.crop.circle")
                }

            Text("Configuraciones")
                .tabItem {
                    Label("Setttings", systemImage: "gear")
                }
            
        }
    }
}

#Preview {
    HomeTabView()
}
