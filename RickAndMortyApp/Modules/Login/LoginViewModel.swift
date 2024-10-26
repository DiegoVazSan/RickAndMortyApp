//
//  LoginViewModel.swift
//  RickAndMortyApp
//
//  Created by Diego Vazquez Sanchez on 25/10/24.
//

import Foundation

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var isValidEmail: Bool = true
    @Published var isValidPassword: Bool = true
    
    var canProceed: Bool {
        return isValidEmail  && isValidPassword
    }
    
    func validateFields() {
        isValidEmail = FieldValidator.isValidEmail(email)
        isValidPassword = FieldValidator.isValidPassword(password)
    }
    
}

