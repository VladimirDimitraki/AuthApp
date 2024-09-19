//
//  ImageEditor.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/19/24.
//

import SwiftUI

struct ImageEditor: View {
    @Binding var image: UIImage
    @State private var scale: CGFloat = 1.0
    @State private var rotation: Angle = .zero
    
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Text("Редактировать")
                    .scaledToFit()
                    .minimumScaleFactor(0.5)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(5)
            }
            .frame(width: 120, height: 40)
            .modifier(ButtonEditStyle())
        }
    }
}

struct ImageEditor_Previews: PreviewProvider {
    static var previews: some View {
        ImageEditor(image: .constant(UIImage(systemName: "person.fill")!))
    }
}
