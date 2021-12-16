//
//  User.swift
//  Portal
//
//  Created by Greg Charyszczak on 03/09/2020.
//

import Foundation

struct User: AppStorable {
    let id: String
    let email: String
    let password: String
    let phoneNumber: String?
    let roles: [UserRole]
    let token: String
}

extension User {
    init(from userDto: UserDTO, with password: String) {
        self.id = userDto.id
        self.email = userDto.email
        self.password = password
        self.phoneNumber = userDto.phoneNumber
        self.roles = UserRole.initManyFrom(userDto.roles)
        self.token = userDto.token
    }
}
