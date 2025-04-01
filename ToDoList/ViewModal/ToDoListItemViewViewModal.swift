//
//  ToDoListItemViewViewModal.swift
//  ToDoList
//
//  Created by Rajat Mishra on 30/03/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewViewModal: ObservableObject {
    
    init() {
        
    }
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.toggleDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(item.id)
            .setData(itemCopy.asDiction())
    }
}
