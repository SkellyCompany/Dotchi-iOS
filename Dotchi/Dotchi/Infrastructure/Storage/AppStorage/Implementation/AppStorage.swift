//
//  AppStorage.swift
//  Portal
//
//  Created by Greg Charyszczak on 22/10/2020.
//

import Foundation
import SwiftyLogger
import SwiftyCryptor

class AppStorage {
    let kUserPreferences = "kUserPreferences1"
    let kUser = "kUser1"

    let appDefaults: AppDefaultsProtocol
    let userDefaults: UserDefaultsProtocol
    let logger: LoggerProtocol
    let cryptor: CryptorProtocol

    // MARK: Stored Data
    var _userPreferences: UserPreferences {
        didSet {
            do {
                let encodedData = try JSONEncoder().encode(_userPreferences)
                userDefaults.set(encodedData, forKey: kUserPreferences)
            } catch let error {
                logger.log(type: .error, name: "couldNotSaveUserPreferencesToAppStorage", description: error.longDescription)
            }
        }
    }

    var _user: User? {
        didSet {
            do {
                if _user == nil {
                    userDefaults.set(nil, forKey: kUser)
                } else {
                    let encodedData = try JSONEncoder().encode(_user)
                    userDefaults.set(encodedData, forKey: kUser)
                }
            } catch let error {
                logger.log(type: .error, name: "couldNotSaveUserToAppStorage", description: error.longDescription)
            }
        }
    }

    // MARK: Initialization
    init(appDefaults: AppDefaultsProtocol, userDefaults: UserDefaultsProtocol, logger: LoggerProtocol, cryptor: CryptorProtocol) {
        self.appDefaults = appDefaults
        self.userDefaults = userDefaults
        self.logger = logger
        self.cryptor = cryptor
        
        let decoder = JSONDecoder()
        if let userPreferencesData = userDefaults.data(forKey: kUserPreferences) {
            do {
                let userPreferences = try decoder.decode(UserPreferences.self, from: userPreferencesData)
                self._userPreferences = userPreferences
            } catch let error {
                logger.log(type: .error, name: "couldNotRetrieveUserPreferencesFromAppStorage", description: error.longDescription)
                self._userPreferences = appDefaults.defaultPreferences
            }
        } else {
            self._userPreferences = appDefaults.defaultPreferences
        }

        if let userData = userDefaults.data(forKey: kUser) {
            do {
                let user = try decoder.decode(User.self, from: userData)
                self._user = user
            } catch let error {
                logger.log(type: .error, name: "couldNotRetrieveUserFromAppStorage", description: error.longDescription)
                self._user = nil
            }
        } else {
            self._user = nil
        }
    }
}
