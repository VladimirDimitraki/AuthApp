//
//  RegistrationView.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/17/24.
//

import SwiftUI

struct RegistrationView: View {
    @ObservedObject var viewModel = RegistrationViewModel()
    
    var body: some View {
        VStack {
            Text("Регистрация")
                .font(.title)
            
            FormField(fieldName: "First name:", secureField: false, fieldValue: $viewModel.firstName)
            
            FormField(fieldName: "Last name:", secureField: false, fieldValue: $viewModel.lastName)
            
            FormField(fieldName: "Email:", secureField: false, fieldValue: $viewModel.email)
            
            if viewModel.isNecessarilyEmailField {
                RequirementText(text: "Обязательное поле", isValid: viewModel.isEmailValid)
            }
            
            RequirementText(text: "@gmail.com", isValid: viewModel.isEmailValid)
            
            FormField(fieldName: "Password:", secureField: true, fieldValue: $viewModel.password)
            
            if viewModel.isNecessarilyPasswordField {
                RequirementText(text: "Обязательное поле", isValid: viewModel.isPasswordLenghtValid)
            }
            
            RequirementText(text: "Минимум 8 символов", isValid: viewModel.isPasswordLenghtValid)
            
            SignInButton(title: "Зарегистрироваться") {
                Registration().registrationNewUser(email: viewModel.email, password: viewModel.password)
            }
            .padding([.leading, .trailing])
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

