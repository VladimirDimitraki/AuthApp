//
//  SignInButton.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/16/24.
//

import SwiftUI

struct SignInButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        HStack {
            Button(action: action) {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 55)
                    .cornerRadius(30)
                    .foregroundColor(.black)
                    .overlay {
                        Text(title)
                            .foregroundColor(.white)
                            .font(.title)
                    }
            }
        }
    }
}

struct SignInButton_Previews: PreviewProvider {
    static var previews: some View {
        SignInButton(title: "button", action: {})
    }
}
