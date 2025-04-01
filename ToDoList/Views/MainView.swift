//
//  ContentView.swift
//  ToDoList
//
//  Created by Rajat Mishra on 30/03/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModal = MainViewViewModal()
    
    var body: some View {
        if viewModal.isSignedIn && !viewModal.currentUser.isEmpty {
            
            accountTypeView
        }
        else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountTypeView: some View {
        TabView {
            ToDoListView(userId: viewModal.currentUser )
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
