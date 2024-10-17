//
//  RMAlert.swift
//  RickAndMortyApp
//
//  Created by Diego Vazquez Sanchez on 17/10/24.
//

import SwiftUI

struct RMAlert: View {
    var title: String?
    var message: String
    var buttonText: String?
    var onDismiss: () -> Void
    
    var body: some View {
        ZStack {
            
            Color.black.opacity(0.7)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text(title ?? Constants.Strings.warning)
                    .font(.headline)
                    .foregroundColor(.main)
                    .bold()
                Text(message)
                    .font(.body)
                    .multilineTextAlignment(.center)
                Button(action: onDismiss) {
                    Text(buttonText ?? Constants.Strings.accept)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(
                        gradient: Gradient(colors: [.lightAccent, .main]),
                        startPoint: .leading,
                        endPoint: .trailing
                    ))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
            .background(.mainBackground)
            .cornerRadius(12)
            .shadow(radius: 8)
            .padding(.horizontal, 40)
        }
    }
}

