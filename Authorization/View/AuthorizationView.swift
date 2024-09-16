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
        VStack {
            Text("Вход")
                .fontWeight(.bold)
                .font(.title)
            
            FormField(fieldName: "Email:", secureField: false, fieldValue: $viewModel.email)
            
            RequirementText(text: "example@gmail.com", isValid: viewModel.isEmailValid)
            
            FormField(fieldName: "Password:", secureField: true, fieldValue: $viewModel.password)
            
            RequirementText(text: "Минимум 8 символов", isValid: viewModel.isPasswordLenghtValid)
            
            SignInButton(viewModel: viewModel)
            
            AuthtenticationError(viewModel: viewModel)
            
            //Restore password
            RestorePassword()
        }
        .padding([.leading, .trailing])
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView()
    }
}
