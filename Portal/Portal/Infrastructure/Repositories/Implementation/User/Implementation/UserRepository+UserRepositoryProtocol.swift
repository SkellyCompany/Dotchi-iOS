//
//  UserRepository+UserRepositoryProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 20/09/2021.
//

import Foundation

extension UserRepository: UserRepositoryProtocol {
    func getLoggedInUser() -> User? {
        return storage.user
    }
    
    func saveLoggedInUser(user: User) {
        storage.user = user
    }
    
    func clearLoggedInUser() {
        storage.user = nil
    }
}
