//
//  UserDTO.swift
//  Portal
//
//  Created by Greg Charyszczak on 11/05/2021.
//

import Foundation

struct UserDTO: DTO {
    private enum CodingKeys : String, CodingKey {
        case id, email, passwordHash = "password_hash", phoneNumber = "phone_number", token, roles
    }
    
    let id: String
    let email: String
    let passwordHash: String
    let phoneNumber: String?
    let token: String
    let roles: [UserRoleDTO]
}
