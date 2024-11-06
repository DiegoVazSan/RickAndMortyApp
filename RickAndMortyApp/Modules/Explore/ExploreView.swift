//
//  ExploreView.swift
//  RickAndMortyApp
//
//  Created by Diego Vazquez Sanchez on 06/11/24.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack {
            UIFactory.baseView {
                Text("Explore!")
            }
            .navigationTitle(Constants.Strings.exploreTitle)
        }
        
    }
}

#Preview {
    ExploreView()
}
