//
//  LoginView.swift
//  RickAndMortyApp
//
//  Created by Diego Vazquez Sanchez on 16/10/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            Color.mainBackground.ignoresSafeArea()
            VStack {
                Image(Constants.Images.RMPortal)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .padding()
                
                Text(Constants.Strings.welcomeMessage)
                    .font(.largeTitle)
                    .padding(.bottom, 40)
                
                TextField(Constants.Strings.email,
                          text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(viewModel.isValidEmail ? .blue : .red, lineWidth: 2)
                        .padding()
                )
                
                SecureField(Constants.Strings.password,
                            text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(viewModel.isValidPassword ? .blue : .red, lineWidth: 2)
                        .padding()
                )
                
                UIFactory.loginButton(title: Constants.Strings.loginMsg,
                                      action: {
                    viewModel.validateFields()
                })
                .padding()
                
                Spacer()
            }
            .padding()
            
        }
    }
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

