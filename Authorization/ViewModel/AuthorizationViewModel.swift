//
//  AuthorizedViewModel.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/16/24.
//

import Foundation
import Combine
import FirebaseAuth

class AuthorizationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var failureAutorizationMassage: String?
    @Published var failureResetPassword: String?
    
    @Published var isSecure = false
    @Published var isEmailValid = false
    @Published var isPasswordLenghtValid = false
    
    @Published var user: User?
    
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
    }
}
