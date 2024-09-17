//
//  Regostration.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/17/24.
//

import Foundation
import FirebaseAuth

class Registration {
    func registrationNewUser(email: String, password: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
            }
            
            result?.user.sendEmailVerification()
        }
        
    }
}
