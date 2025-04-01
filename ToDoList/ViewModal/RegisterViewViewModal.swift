//
//  RegisterViewViewModal.swift
//  ToDoList
//
//  Created by Rajat Mishra on 30/03/25.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModal: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    
    init() {}
    
    func register() {
        guard validate() else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(uid: userId)
        }
    }
    
    private func insertUserRecord(uid: String) {
        let newUser = User(id: uid, name: name, email: email, joined: Foundation.Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users").document(uid)
            .setData(newUser.asDiction())
    }
    
    private func validate() -> Bool {
//        error = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty ,
              !name.trimmingCharacters(in: .whitespaces).isEmpty else {
//            error = "Please fill all the fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
//            error = "Invalid email"
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
}
