//
//  ToDoListViewViewModal.swift
//  ToDoList
//
//  Created by Rajat Mishra on 30/03/25.
//
import FirebaseFirestore
import Foundation


class ToDoListViewViewModal: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id : String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
