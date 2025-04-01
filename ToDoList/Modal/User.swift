//
//  User.swift
//  ToDoList
//
//  Created by Rajat Mishra on 30/03/25.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
