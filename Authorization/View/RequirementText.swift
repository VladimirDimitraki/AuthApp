//
//  RequirementText.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/16/24.
//

import SwiftUI

struct RequirementText: View {
    var text: String = ""
    var isValid = false
    
    var body: some View {
        HStack {
            if isValid {
                Image(systemName: "checkmark.square.fill")
                    .foregroundColor(.green)
            }else {
                Image(systemName: "xmark.square.fill")
                    .foregroundColor(.red)
            }
            
            Text(text)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct RequirementText_Previews: PreviewProvider {
    static var previews: some View {
        RequirementText(text: "Минимум 8 символов")
    }
}
