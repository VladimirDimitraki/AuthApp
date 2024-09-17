//
//  RegistrationButton.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/17/24.
//

import SwiftUI

struct RegistrationButton: View {
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Rectangle()
                    .frame(width: 80, height: 50)
                    .cornerRadius(30)
                    .foregroundColor(.black)
                    .overlay {
                        
                    }
            }
        }
    }
}

struct RegistrationButton_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationButton()
    }
}
