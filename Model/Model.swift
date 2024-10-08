//
//  Model.swift
//  AutorizedApp
//
//  Created by Melania Dababi on 9/16/24.
//

import Foundation
import Combine

class UserService: ObservableObject {
    @Published var email: String?
    @Published var password: String?
    @Published var firstName: String?
    @Published var LastName: String?
    
    init(email: String? = nil, password: String? = nil, firstName: String? = nil, LastName: String? = nil) {
        self.email = email
        self.password = password
        self.firstName = firstName
        self.LastName = LastName
    }
}

enum SourceType {
    case camera, photoLibrary
}
