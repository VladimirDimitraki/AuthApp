//
//  AuthorizationView.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/16/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore

struct AuthorizationView: View {
    @ObservedObject private var viewModel = AuthorizationViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Вход")
                    .fontWeight(.bold)
                    .font(.title)
                
                FormField(fieldName: "Email:", secureField: false, fieldValue: $viewModel.email)
                
                RequirementText(text: "example@gmail.com", isValid: viewModel.isEmailValid)
                
                FormField(fieldName: "Password:", secureField: true, fieldValue: $viewModel.password)
                
                RequirementText(text: "Минимум 8 символов", isValid: viewModel.isPasswordLenghtValid)
                
                SignInButton(title: "Войти") {
                    AuthService.shared.signInWithEmail(email: viewModel.email, password: viewModel.password) { result in
                        switch result {
                        case .success(let user):
                            viewModel.user = user
                        case .failure(let error):
                            viewModel.failureAutorizationMassage = "Ошибка авторизации: \(error.localizedDescription)"
                        }
                    }
                }
                
                AuthtenticationError(viewModel: viewModel)
                
                RestorePasswordView(viewModel: viewModel)
                
                
                NavigationLink(destination: RegistrationView()) {
                    Text("Создать аккаунт")
                }
                
            }
            .padding([.leading, .trailing])
        }
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView()
    }
}
