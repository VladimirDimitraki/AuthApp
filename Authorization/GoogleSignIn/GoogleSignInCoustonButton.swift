//
//  GoogleSignInCoustonButton.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/17/24.
//

import SwiftUI

struct GoogleSignInCoustonButton: View {
    @ObservedObject var viewModel: GoogleSignInButtonViewModel
    
    var body: some View {
        Button {
            Task {
             try await viewModel.signInWithGoogle()
            }
        } label: {
            HStack {
                Image("GoogleImage")
                    .resizable()
                    .scaledToFit()
                    .padding(5)
                Text("Войти с Google")
                    .font(.system(size: 15))
                Spacer()
            }
            .frame(width: 170, height: 40)
            .background(Color("CustomGrayColor"))
            .cornerRadius(40)
        }
    }
}

struct GoogleSignInCoustonButton_Previews: PreviewProvider {
    static var previews: some View {
        GoogleSignInCoustonButton(viewModel: GoogleSignInButtonViewModel())
    }
}
