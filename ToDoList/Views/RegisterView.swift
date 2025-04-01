//
//  RegisterView.swift
//  ToDoList
//
//  Created by Rajat Mishra on 30/03/25.
//

import SwiftUI

struct RegisterView: View {
    
//    @State var name = ""
//    @State var email = ""
//    @State var password = ""
    @StateObject var viewModal = RegisterViewViewModal()
    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subTitle: "Start organizing things", angle: -15, backgroundColor: .orange)
            
            Form {
                TextField("Name", text: $viewModal.name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModal.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModal.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TLButton(title: "Create Account", backgroundColor: .green) {
                    viewModal.register()
                }
                .padding()
            }
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
