//
//  Regostration.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/17/24.
//

import Foundation
import FirebaseAuth

class Registration {
    func registrationNewUser(email: String, password: String, completion: @escaping (Result<User,Error>) -> ()) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            CurrentUser().getCurrentUser { result in
                switch result {
                case .success(let user):
                    completion(.success(user))
                    return
                case .failure(let error):
                    completion(.failure(error))
                }
            }
            
            result?.user.sendEmailVerification()
        }
    }
}
