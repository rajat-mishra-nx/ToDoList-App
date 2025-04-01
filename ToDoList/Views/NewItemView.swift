//
//  NewItemView.swift
//  ToDoList
//
//  Created by Rajat Mishra on 30/03/25.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModal = NewItemViewViewModal()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 30))
                .bold()
                .padding(.top,50)
            
            Form {
                TextField("Title", text: $viewModal.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModal.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(title: "Save", backgroundColor: .blue) {
                    if viewModal.canSave {
                        viewModal.save()
                        newItemPresented = false
                    }
                    else {
                        viewModal.showAlert = true
                    }
                    
                }
                .padding()
            }
            .alert(isPresented: $viewModal.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill all the fields and select due date that is today or newer"), dismissButton: .default(Text("OK"))) 
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        //
    }))
}
