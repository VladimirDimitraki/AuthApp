//
//  AuthorizedViewModel.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/16/24.
//

import Foundation
import Combine
import FirebaseAuth
import SwiftUI

class AuthorizationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var firstName = ""
    @Published var lastName = ""
    
    @Published var failureAutorizationMassage: String?
    @Published var failureResetPassword: String?
    
    @Published var isLoggedIn = false
    @Published var isSecure = false
    @Published var isEmailValid = false
    @Published var isPasswordLenghtValid = false
    @Published var isNecessarilyEmailField = false
    @Published var isNecessarilyPasswordField = false
    @Published var isShowedPhotoPicker = false
    @Published var user: User?
    
    @Published var defaultImage = UIImage(systemName: "person.fill")!
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        $email
            .receive(on: RunLoop.main)
            .map { email in
                if email.contains("@gmail.com") {
                    return true
                }
                return false
            }
            .assign(to: \.isEmailValid, on: self)
            .store(in: &cancellableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map { password in
                return password.count >= 8
            }
            .assign(to: \.isPasswordLenghtValid, on: self)
            .store(in: &cancellableSet)
        
        $email
            .receive(on: RunLoop.main)
            .map { email in
                email.count == 0
            }
            .assign(to: \.isNecessarilyEmailField, on: self)
            .store(in: &cancellableSet)
        
        $password
            .receive(on: RunLoop.main)
            .map { password in
                password.count == 0
            }
            .assign(to: \.isNecessarilyPasswordField, on: self)
            .store(in: &cancellableSet)
    }
    
    func isValidBothForm() -> Bool {
        return isEmailValid && isPasswordLenghtValid
    }
}

