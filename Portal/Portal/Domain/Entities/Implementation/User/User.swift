//
//  User.swift
//  Portal
//
//  Created by Greg Charyszczak on 03/09/2020.
//

import Foundation

struct User: AppStorable, OutputData {
    let id: String
    let email: String
    let password: String
    let phoneNumber: String?
    let roles: [UserRole]
    let token: String
}
