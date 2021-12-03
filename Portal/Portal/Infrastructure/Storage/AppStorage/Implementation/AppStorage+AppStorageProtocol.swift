//
//  AppStorage+AppStorageProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 13/09/2021.
//

import Foundation

extension AppStorage: AppStorageProtocol {
    var userPreferences: UserPreferences {
        get {
            return _userPreferences
        }
        set {
            _userPreferences = newValue
        }
    }
    
    var user: User? {
        get {
            do {
                if let _user = _user {
                    let decryptedPassword = try cryptor.decrypt(value: _user.password)
                    return User(id: _user.id, email: _user.email, password: decryptedPassword, phoneNumber: _user.phoneNumber, roles: _user.roles, token: _user.token)
                } else {
                    return nil
                }
            } catch let error {
                logger.log(type: .error, name: "couldNotGetUser", description: error.longDescription)
                return nil
            }
        }
        set {
            do {
                if let newValue = newValue {
                    let encryptedPassword = try cryptor.encrypt(value: newValue.password)
                    _user = User(id: newValue.id, email: newValue.email, password: encryptedPassword, phoneNumber: newValue.phoneNumber, roles: newValue.roles, token: newValue.token)
                } else {
                    _user = nil
                }
            } catch let error {
                logger.log(type: .error, name: "couldNotSetUser", description: error.longDescription)
            }
        }
    }
}
