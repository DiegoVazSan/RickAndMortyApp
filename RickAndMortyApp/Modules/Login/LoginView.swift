//
//  LoginView.swift
//  RickAndMortyApp
//
//  Created by Diego Vazquez Sanchez on 16/10/24.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var isLoginSuccessful: Bool = false
    
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
                          text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                SecureField(Constants.Strings.password,
                            text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                UIFactory.loginButton(title: Constants.Strings.loginMsg,
                                      action: {
                    showAlert = !validateFields()
                })
                .padding()
                
                Spacer()
            }
            .padding()
            
            if showAlert {
                
                RMAlert(message: Constants.Strings.incompleteFields,
                        onDismiss: { showAlert = false })
            }
        }
    }
    
    func isValidEmail() -> Bool {
        FieldValidator.isValidEmail(username)
    }
    
    func isValidPassword() -> Bool{
        FieldValidator.isValidPassword(password)
    }
    
    func validateFields() -> Bool {
        if isValidEmail() || isValidPassword() {
            return true
        } else {
            return false
        }
    }
    
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

