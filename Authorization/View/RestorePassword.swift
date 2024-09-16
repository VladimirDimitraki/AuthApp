//
//  RestorePassword.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/16/24.
//

import SwiftUI

struct RestorePassword: View {
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            Text("Забыли пароль?")
            
            Button("Восстоновить") {
                isPresented.toggle()
            }
            .sheet(isPresented: $isPresented) {
                RestorePasswordModalView()
            }
            
        }
        .padding()
    }
}

struct RestorePasswordModalView: View {
    var body: some View {
        Text("modalView")
    }
}

struct RestorePassword_Previews: PreviewProvider {
    static var previews: some View {
        RestorePassword()
    }
}
