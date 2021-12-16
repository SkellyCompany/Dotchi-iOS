//
//  UserRole.swift
//  Portal
//
//  Created by Greg Charyszczak on 15/06/2021.
//

import Foundation

enum UserRole: String, AppStorable {
    case user = "User"
}

extension UserRole {
    static func initManyFrom(_ userRoleDtos: [UserRoleDTO]) -> [UserRole] {
        var userRoles: [UserRole] = []
        userRoleDtos.forEach {userRoleDto in
            if let userRole = UserRole(rawValue: userRoleDto.name) {
                userRoles.append(userRole)
            }
        }
        return userRoles
    }
}
