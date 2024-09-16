//
//  AuthorizationViewSecureField.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/16/24.
//

import SwiftUI

struct FormField: View {
    var fieldName: String = ""
    var secureField: Bool
    @State var isSecure = false
    @Binding var fieldValue: String
    
    var body: some View {
        HStack {
            if isSecure {
                ZStack {
                    SecureField(fieldName, text: $fieldValue)
                        .padding()
                        .background(Color("CustomGrayColor"))
                        .cornerRadius(20)
                }
            } else {
                ZStack {
                    TextField(fieldName, text: $fieldValue)
                        .padding()
                        .background(Color("CustomGrayColor"))
                        .cornerRadius(20)
                }
            }
        }
        .overlay(alignment: .trailing) {
            if secureField {
                EyeButtonFormField(isSecure: $isSecure)
                    .padding()
            }
        }
        
    }
}

struct EyeButtonFormField: View {
    @Binding var isSecure: Bool
    
    var body: some View {
        Button {
            isSecure.toggle()
        } label: {
                Image(systemName: isSecure ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(isSecure ? .gray : .black)
        }
    }
}
    
    struct AuthorizationViewSecureField_Previews: PreviewProvider {
        @State static var fieldValue = ""
        static var previews: some View {
            FormField(fieldName: "Password",secureField: true, isSecure: true, fieldValue: $fieldValue)
        }
    }
