//
//  GoogleSignIn.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/17/24.
//

import Foundation
import GoogleSignIn
import FirebaseAuth
import FirebaseCore
import GoogleSignInSwift

class GoogleSignInButtonViewModel: ObservableObject {
    @Published var isLoginSuccesed = false
    
    func signInWithGoogle() async -> Bool {
        guard let rootViewController = await UIApplication.shared.windows.first?.rootViewController else {
            print("Error: Unable to find rootViewController")
            return false
        }
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return false }
        
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.configuration = config
        
        do {
            let userAuthentication = try await GIDSignIn.sharedInstance.signIn(
                withPresenting: rootViewController)
            
            let user = userAuthentication.user
            guard let idToken = user.idToken else {
                return false
            }
            
            let accessToken = user.accessToken
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
            
            let result = try await Auth.auth().signIn(with: credential)
            let firebaseUser = result.user
            print("User: \(firebaseUser.uid) signed in with email \(firebaseUser.email ?? "unknown")")
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
}
