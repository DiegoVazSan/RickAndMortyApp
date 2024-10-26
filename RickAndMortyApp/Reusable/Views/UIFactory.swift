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
    
    static func txtField(title: String, text: Binding<String>,
                         isValid: Bool) -> some View {
        TextField(title, text: text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(isValid ? .auxiliarGray : .red, lineWidth: 1)
                    .padding()
            )
    }
    
    static func secureTxtField(title: String, text: Binding<String>,
                               isValid: Bool) -> some View {
        SecureField(title,
                    text: text)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(isValid ? .auxiliarGray : .red, lineWidth: 1)
                .padding()
        )
    }
    
    static func coverImg(img: String) -> some View {
        Image(img)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipped()
            .padding()
    }
    
    static func largeTitle(title: String) -> some View {
        Text(title)
            .font(.largeTitle)
            .padding(.bottom, 40)
    }
    
    static func animatedImage(image: String, scale: CGFloat, rotation: Double, duration: Double, scaleAnimation: Bool, isRotated: Bool) -> some View {
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
    
    static func backgroundGradient() -> some View {
        LinearGradient(
            gradient: Gradient(colors: [.lightAccent, .main]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ).ignoresSafeArea()
    }
    
}
