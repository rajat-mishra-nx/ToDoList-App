//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Rajat Mishra on 30/03/25.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    
    init() {
        FirebaseApp.configure() 
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
