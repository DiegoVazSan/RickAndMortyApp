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
            ZStack {
                
                UIFactory.backgroundGradient()
                
                UIFactory.animatedImage(image: Constants.Images.lightGreen,
                                        scale: isScaled ? 1.5 : 1.0,
                                        rotation: isRotated ? 360 : 0,
                                        duration: 1,
                                        scaleAnimation: true,
                                        isRotated: isRotated)
                
                UIFactory.animatedImage(image: Constants.Images.RMLogo,
                                        scale: 1.0,
                                        rotation: isRotated ? 360 : 0,
                                        duration: 5,
                                        scaleAnimation: false,
                                        isRotated: isRotated)
            }
            
            .fullScreenCover(isPresented: $goToNextView) {
                LoginView()
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

#Preview {
    SplashScreenView()
}
