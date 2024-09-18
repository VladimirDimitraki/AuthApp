//
//  ContentView.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/16/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = AuthorizationViewModel()
    
    var body: some View {
        if viewModel.isLoggedIn {
            HomePage()
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
