//
//  UserRole+init.swift
//  Portal
//
//  Created by Greg Charyszczak on 20/09/2021.
//

import Foundation

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
