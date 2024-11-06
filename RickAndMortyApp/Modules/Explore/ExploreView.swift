//
//  ExploreView.swift
//  RickAndMortyApp
//
//  Created by Diego Vazquez Sanchez on 06/11/24.
//

import SwiftUI

struct ExploreView: View {
    @StateObject private var viewModel = ExploreViewModel()
    @State private var selectedCategory: Category = .all
    
    
        private var categoryMenu: some View {
            HStack {
                ForEach(Category.allCases, id: \.self) { category in
                    Button(action: {
                        selectedCategory = category
                    }) {
                        Text(category.rawValue)
                            .padding()
                            .foregroundColor(selectedCategory == category ? Color.accent : Color.main)
                            .background(selectedCategory == category ? Color.main : Color.clear)
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.bottom, 10)
        }
    
    
    var body: some View {
        NavigationStack {
            UIFactory.baseView {
                categoryMenu
                Spacer()
            }
            .navigationTitle(Constants.Strings.exploreTitle)
        }
        
    }
}

#Preview {
    ExploreView()
}
