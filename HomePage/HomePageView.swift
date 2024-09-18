//
//  HomePage.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/16/24.
//

import SwiftUI

struct HomePage: View {
    @ObservedObject var viewModel: AuthorizationViewModel
    
    var body: some View {
        VStack {
            Image(uiImage: viewModel.defaultImage)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .onTapGesture {
                    viewModel.isShowedPhotoPicker = true
                }
                .frame(width: 200, height: 200)
            
            HStack {
                Text(viewModel.user?.email ?? "User")
            }
            
            Spacer()
            
                .sheet(isPresented: $viewModel.isShowedPhotoPicker) {
                    PhotoPicker(avatarImage: $viewModel.defaultImage)
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(viewModel: AuthorizationViewModel())
    }
}
