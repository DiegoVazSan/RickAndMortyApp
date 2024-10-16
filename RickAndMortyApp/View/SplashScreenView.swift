//
//  SplashScreenView.swift
//  RickAndMortyApp
//
//  Created by Diego Vazquez Sanchez on 15/10/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isRotated = false
    @State private var isScaled = false
    @State private var goToNextView = false
    @State private var animationCompleted = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.main.ignoresSafeArea()
                
                animatedImage(
                    image: AssetConstants.Images.lightGreen,
                    scale: isScaled ? 1.5 : 1.0,
                    rotation: isRotated ? 360 : 0,
                    duration: 1,
                    scaleAnimation: true
                )
                
                animatedImage(
                    image: AssetConstants.Images.RMLogo,
                    scale: 1.0,
                    rotation: isRotated ? 360 : 0,
                    duration: 5,
                    scaleAnimation: false
                )
            }
            
            .navigationDestination(isPresented: $goToNextView) {
                CharacterListView(
                    viewModel: CharacterViewModel(networkService: NWServiceManager())
                )
            }
            .onAppear {
                
                withAnimation(.linear(duration: 1)) {
                    isRotated = true
                    isScaled.toggle()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    animationCompleted = true

                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        goToNextView = true
                    }
                }
            }
        }
    }

    
    private func animatedImage(image: String, scale: CGFloat, rotation: Double, duration: Double, scaleAnimation: Bool) -> some View {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: scaleAnimation ? 400 : 300, height: scaleAnimation ? 400 : 300)
                .scaleEffect(scale)
                .rotationEffect(.degrees(rotation))
                .animation(
                    .linear(duration: duration).repeatForever(autoreverses: false), value: isRotated
                )
                .clipped()
                .padding()
        }
}

#Preview {
    SplashScreenView()
}
