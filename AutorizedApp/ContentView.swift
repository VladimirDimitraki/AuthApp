//
//  ContentView.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/16/24.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @ObservedObject var viewModel = AuthorizationViewModel()
    
    var body: some View {
        if viewModel.isLoggedIn && Auth.auth().currentUser != nil {
            HomePage(viewModel: viewModel)
        } else {
            AuthorizationView(viewModel: viewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
