//
//  AuthtenticationError.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/16/24.
//

import SwiftUI

struct AuthtenticationError: View {
    @ObservedObject var viewModel: AuthorizationViewModel
    
    var body: some View {
        Text(viewModel.failureAutorizationMassage ?? "no errors")
            .foregroundColor(.red)
    }
}

struct AuthtenticationError_Previews: PreviewProvider {
    static var previews: some View {
        AuthtenticationError(viewModel: AuthorizationViewModel())
    }
}
