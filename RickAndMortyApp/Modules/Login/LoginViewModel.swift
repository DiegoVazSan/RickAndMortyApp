//
//  LoginViewModel.swift
//  RickAndMortyApp
//
//  Created by Diego Vazquez Sanchez on 25/10/24.
//

import Combine
import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email: String = "" {
        didSet { validateEmail() }
    }
    @Published var password: String = ""{
        didSet { validatePassword() }
    }
    @Published var isValidEmail: Bool = true
    @Published var isValidPassword: Bool = true
    @Published var showAlert: Bool = false
    
    private var validatedFields: Bool {
        return isValidEmail  && isValidPassword
    }
    
    private func validateEmail() {
        isValidEmail = FieldValidator.isValidEmail(email)
    }
    
    private func validatePassword() {
        isValidPassword = FieldValidator.isValidPassword(password)
    }
    
    private func checkAllFields(){
        validateEmail()
        validatePassword()
    }
    
    func login(){
        checkAllFields()
        if validatedFields {
            print("continuar a la siguiente vista")
        } else {
            showAlert = true
        }
    }
    
}
