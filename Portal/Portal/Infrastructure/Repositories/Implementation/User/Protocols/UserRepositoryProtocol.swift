//
//  UserRepositoryProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 14/06/2021.
//

import Foundation

protocol UserRepositoryProtocol {
    func getLoggedInUser() -> User?
    func saveLoggedInUser(user: User)
    func clearLoggedInUser()
}
