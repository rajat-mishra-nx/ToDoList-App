//
//  MainViewViewModal.swift
//  ToDoList
//
//  Created by Rajat Mishra on 30/03/25.
//
import FirebaseAuth
import Foundation

class MainViewViewModal: ObservableObject {
    @Published var currentUser: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener({ [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUser = user?.uid ?? ""
            }
        })
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}

