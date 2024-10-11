//
//  RMImageView.swift
//  RickAndMortyApp
//
//  Created by Diego Vazquez Sanchez on 10/10/24.
//

import SwiftUI

struct RMImage: View {
    let imageUrl: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
            } else if phase.error != nil {
                Image(AssetConstants.Images.notFound)
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView()
            }
        }
    }
}
