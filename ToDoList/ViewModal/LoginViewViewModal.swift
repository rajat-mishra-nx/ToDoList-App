//
//  LoginViewViewModal.swift
//  ToDoList
//
//  Created by Rajat Mishra on 30/03/25.
//

import FirebaseAuth
import Foundation

class LoginViewViewModal: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var error = ""
    
    init() {}
    
    func login() {
        guard validate() else { return }
        
        //Login 
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        error = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            error = "Please fill all the fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            error = "Invalid email"
            return false
        }
        
        return true
    }
}
