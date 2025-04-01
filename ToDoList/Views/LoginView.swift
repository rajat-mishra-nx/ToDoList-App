//
//  LoginView.swift
//  ToDoList
//
//  Created by Rajat Mishra on 30/03/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModal()
    
    var body: some View {
        NavigationView {
            VStack {
                //hEADER
                HeaderView(title: "To Do List", subTitle: "Get things done", angle: 15, backgroundColor: .pink)
                
                if !viewModel.error.isEmpty {
                    Text(viewModel.error)
                        .foregroundStyle(.red)
                }
                
                //Login Form
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TLButton(title: "Login", backgroundColor: .blue) {
                        viewModel.login()
                    }
                    .padding()

                }
                
                
                
                //Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                .padding(.bottom,50)
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
