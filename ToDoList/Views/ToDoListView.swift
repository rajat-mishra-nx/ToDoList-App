//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Rajat Mishra on 30/03/25.
//

import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModal: ToDoListViewViewModal
    @FirestoreQuery var items: [ToDoListItem]
    
//    private let userId: String
    
    init(userId : String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        
        self._viewModal = StateObject(wrappedValue: ToDoListViewViewModal(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModal.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(.plain)
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModal.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }

            }
            .sheet(isPresented: $viewModal.showingNewItemView) {
                NewItemView(newItemPresented: $viewModal.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "")
}
