//
//  RestorePassword.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/16/24.
//

import SwiftUI
import Firebase

class RestorePassword {
    func resetPassword(email: String, completeion: @escaping (Error?) -> ()) {
        Auth .auth().sendPasswordReset(withEmail: email) { error in
            completeion(error)
        }
    }
}

struct RestorePasswordView: View {
    @State private var isPresented = false
    @ObservedObject var viewModel: AuthorizationViewModel
    
    var body: some View {
        VStack {
            Text("Забыли пароль?")
            
            Button("Восстоновить") {
                isPresented.toggle()
            }
            .sheet(isPresented: $isPresented) {
                RestorePasswordModalView(viewModel: viewModel)
            }
            
        }
        .padding()
    }
}

struct RestorePasswordModalView: View {
    @ObservedObject var viewModel: AuthorizationViewModel
    
    var body: some View {
        VStack {
            Text("Восстановление пароля")
                .font(.title)
            
            FormField(fieldName: "Email", secureField: false, fieldValue: $viewModel.email)
            
            
            SignInButton(title: "Восстановить") {
                RestorePassword().resetPassword(email: viewModel.email) { result in
                    switch result {
                        
                    }
                }
            }
        }
    }
}

struct RestorePassword_Previews: PreviewProvider {
    static var previews: some View {
        RestorePasswordView(viewModel: AuthorizationViewModel())
    }
}

struct RestorePasswordModalView_Previews: PreviewProvider {
    static var previews: some View {
        RestorePasswordModalView(viewModel: AuthorizationViewModel())
    }
}
