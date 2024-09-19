//
//  ButtonModifier.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/19/24.
//

import SwiftUI

struct ButtonEditStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .background(.white)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue, lineWidth: 5)
            }
    }
}

struct ButtonEditStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button {
        } label: {
            Text("Edit")
        }
        .modifier(ButtonEditStyle())
    }
}
