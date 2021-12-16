//
//  User+init.swift
//  Portal
//
//  Created by Greg Charyszczak on 20/09/2021.
//

import Foundation

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
