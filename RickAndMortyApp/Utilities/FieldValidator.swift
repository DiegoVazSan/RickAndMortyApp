//
//  FieldValidator.swift
//  RickAndMortyApp
//
//  Created by Diego Vazquez Sanchez on 17/10/24.
//

import Foundation

struct FieldValidator {
    
    typealias RuleValidation = (String) -> Bool

    static func isValidEmail(_ email: String) -> Bool {
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    /// Allows a minimum of 8 characters
    /// At least one number
    static func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = #"^(?=.*[0-9]).{8,}$"#
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
    
    static func validate(_ input: String, using validator: RuleValidation) -> Bool {
        return validator(input)
    }
}
