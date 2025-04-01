//
//  NewItemViewViewModal.swift
//  ToDoList
//
//  Created by Rajat Mishra on 30/03/25.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModal: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {
        
    }
    
    func save() {
        guard canSave else {
            return
        }
        
        //Get userid
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        //Create Modal
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        
        
        
        //Save Modal
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDiction())
        
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate > Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
