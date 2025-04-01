//
//  Extensions.swift
//  ToDoList
//
//  Created by Rajat Mishra on 30/03/25.
//

import Foundation

extension Encodable {
    func asDiction() -> [String :  Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        
        do {
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            return json ?? [:]
        }
        catch {
            return [:]
        }
        
       
    }
}
