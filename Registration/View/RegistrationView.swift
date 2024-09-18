//
//  RegistrationView.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/17/24.
//

import SwiftUI

struct RegistrationView: View {
    @ObservedObject var viewModel: AuthorizationViewModel
    
    var body: some View {
        VStack {
            Text("Регистрация")
                .font(.title)
            Group {
                FormField(fieldName: "First name:", secureField: false, fieldValue: $viewModel.firstName)
                
                FormField(fieldName: "Last name:", secureField: false, fieldValue: $viewModel.lastName)
                
                FormField(fieldName: "Email:", secureField: false, fieldValue: $viewModel.email)
                
                if viewModel.isNecessarilyEmailField {
                    RequirementText(text: "Обязательное поле @gmail.com", isValid: viewModel.isEmailValid)
                }
                
                FormField(fieldName: "Password:", secureField: true, fieldValue: $viewModel.password)
                
                if viewModel.isNecessarilyPasswordField {
                    RequirementText(text: "Обязательное поле минимум 8 символов", isValid: viewModel.isPasswordLenghtValid)
                }
                
                if !viewModel.isValidBothForm() {
                    SignInButton(title: "!") {}
                    Text("Заполните обязательные поля")
                        .foregroundColor(.red)
                        .animation(.spring())
                } else {
                    SignInButton(title: "Зарегистрироваться") {
                        Registration().registrationNewUser(email: viewModel.email, password: viewModel.password) { result in
                            switch result {
                            case .success(let user):
                                viewModel.user = user
                                viewModel.failureAutorizationMassage = "Письмо с подтверждением отправлено на почту"
                            case .failure(let error):
                                viewModel.failureAutorizationMassage = error.localizedDescription
                            }
                        }
                    }
                    AuthtenticationError(viewModel: viewModel)
                }
            }
        }
        .padding([.leading, .trailing])
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(viewModel: AuthorizationViewModel())
    }
}

