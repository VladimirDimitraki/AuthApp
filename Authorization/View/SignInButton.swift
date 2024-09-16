//
//  SignInButton.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/16/24.
//

import SwiftUI

struct SignInButton: View {
    @ObservedObject var viewModel: AuthorizationViewModel
    
    var body: some View {
        HStack {
            Button {
                AuthService.shared.signInWithEmail(email: viewModel.email, password: viewModel.password) { result in
                    switch result {
                    case .success(let user):
                        viewModel.user = user
                    case .failure(let error):
                        viewModel.failureAutorizationMassage = "Ошибка авторизации: \(error.localizedDescription)"
                    }
                }
            } label: {
                 Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 55)
                    .cornerRadius(30)
                    .foregroundColor(.black)
                    .overlay {
                        Text("Войти")
                            .foregroundColor(.white)
                            .font(.title)
                    }
            }
        }
    }
}

struct SignInButton_Previews: PreviewProvider {
    static var previews: some View {
        SignInButton(viewModel: AuthorizationViewModel())
    }
}
