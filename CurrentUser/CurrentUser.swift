//
//  User.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/18/24.
//

import Foundation
import FirebaseAuth

class CurrentUser {
    func getCurrentUser(completion: (Result<User, Error>) -> ()) {
        let user = Auth.auth().currentUser
        
        if let user = user {
            completion(.success(user))
        }
    }
}
