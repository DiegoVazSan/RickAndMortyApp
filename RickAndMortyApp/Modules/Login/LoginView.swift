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
        UIFactory.baseView(content: {
            
            UIFactory.coverImg(img: Constants.Images.RMPortal)
            
            UIFactory.largeTitle(title: Constants.Strings.welcomeMessage)
            
            UIFactory.txtField(title: Constants.Strings.email,
                               text: $viewModel.email, isValid: viewModel.isValidEmail)
            
            UIFactory.secureTxtField(title: Constants.Strings.password, text: $viewModel.password, isValid: viewModel.isValidPassword)
            
            UIFactory.loginButton(title: Constants.Strings.loginMsg,
                                  action: {
                viewModel.showHomeModule = true
            })
            .padding()
            
            if viewModel.showAlert {
                RMAlert(message: Constants.Strings.incompleteFields) { viewModel.showAlert = false }
            }
            
        })
        .fullScreenCover(isPresented: $viewModel.showHomeModule) {
            HomeTabView()
        }
    }
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

