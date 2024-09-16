//
//  SignIn.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/16/24.
//

import Foundation
import FirebaseAuth
import FirebaseCore

final class AuthService {
    static let shared = AuthService()
    
    private let auth = Auth.auth()
    
    private init() {}
    
    func signInWithEmail(email: String, password: String, completeion: @escaping (Result<User, Error>) -> ()) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let result = result {
                completeion(.success(result.user))
            } else if let error = error {
                completeion(.failure(error))
            }
        }
    }
}
