//
//  RegistrationViewModel.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/17/24.
//

import Foundation
import Combine
import FirebaseAuth

class RegistrationViewModel: AuthorizationViewModel {
    @Published var firstName = ""
    @Published var lastName = ""
    
    @Published var isNecessarilyEmailField = false
    @Published var isNecessarilyPasswordField = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    override init() {
        super.init()
        
        super.$email
            .receive(on: RunLoop.main)
            .map { email in
                email.count == 0
            }
            .assign(to: \.isNecessarilyEmailField, on: self)
            .store(in: &cancellableSet)
        
        super.$password
            .receive(on: RunLoop.main)
            .map { password in
                password.count == 0
            }
            .assign(to: \.isNecessarilyPasswordField, on: self)
            .store(in: &cancellableSet)
    }
}

