//
//  AuthorizationView.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/16/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import GoogleSignInSwift
import GoogleSignIn

struct AuthorizationView: View {
    @ObservedObject var viewModel: AuthorizationViewModel
    
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
                            viewModel.isLoggedIn = true
                            print(viewModel.user?.email)
                        case .failure(let error):
                            viewModel.failureAutorizationMassage = "Ошибка авторизации: \(error.localizedDescription)"
                        }
                    }
                }
                
                Divider()
                
                Group {
                    GoogleSignInCoustonButton(viewModel: GoogleSignInButtonViewModel())
                    
                    AuthtenticationError(viewModel: viewModel)
                    
                    RestorePasswordView(viewModel: viewModel)
                    
                    NavigationLink(destination: RegistrationView(viewModel: AuthorizationViewModel())) {
                        Text("Создать аккаунт")
                    }
                }
            }
            .padding([.leading, .trailing])
        }
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView(viewModel: AuthorizationViewModel())
    }
}
