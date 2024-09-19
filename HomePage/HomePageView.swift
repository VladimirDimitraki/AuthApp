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
            
            
            HStack {
                Button("Camera") {
                    viewModel.sourceType = .camera
                    viewModel.isShowedPhotoPicker = true
                }
                
                Button("Library") {
                    viewModel.sourceType = .photoLibrary
                    viewModel.isShowedPhotoPicker = true
                }
            }
            
            Spacer()
            
                .sheet(isPresented: $viewModel.isShowedPhotoPicker) {
                    if viewModel.sourceType == .camera {
                        PhotoPicker(avatarImage: $viewModel.defaultImage, sourceType: .camera)
                    } else {
                        PhotoPicker(avatarImage: $viewModel.defaultImage, sourceType: .photoLibrary)
                    }
                }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(viewModel: AuthorizationViewModel())
    }
}
