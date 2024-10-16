//
//  UIFactory.swift
//  RickAndMortyApp
//
//  Created by Diego Vazquez Sanchez on 16/10/24.
//

import SwiftUI


struct UIFactory {
    static func loginButton(title: String,
                            action: @escaping () -> Void) -> some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .frame(maxWidth: .infinity)
                .padding()
                .background(LinearGradient(
                    gradient: Gradient(colors: [.lightAccent, .main]),
                    startPoint: .leading,
                    endPoint: .trailing
                ))
                .foregroundColor(.white)
                .cornerRadius(20)
        }
    }
}
