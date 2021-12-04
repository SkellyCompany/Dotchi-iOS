//
//  Endpoint.swift
//  Portal
//
//  Created by Greg Charyszczak on 22/09/2021.
//

import Foundation

enum Endpoint {
    static let loginUrl = "authenticate"
    static let createAccountUrl = "register"
    static let resetPasswordUrl = "user/forgot-password"
    
    case login
    case createAccount
    case resetPassword
}
