//
//  RMImageView.swift
//  RickAndMortyApp
//
//  Created by Diego Vazquez Sanchez on 10/10/24.
//

import SwiftUI
import Kingfisher

struct RMImage: View {
    let imageUrl: String
    
    var body: some View {
        KFImage(URL(string: imageUrl))
            .placeholder {
                ProgressView()
            }
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
            .clipShape(Circle())
    }
}
