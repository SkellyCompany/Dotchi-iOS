//
//  UserPreferencesRepository.swift
//  Portal
//
//  Created by Greg Charyszczak on 22/10/2020.
//

import Foundation
import SwiftyLogger

class UserPreferencesRepository {
    var storage: AppStorageProtocol
    let logger: LoggerProtocol

    init(storage: AppStorageProtocol, logger: LoggerProtocol) {
        self.storage = storage
        self.logger = logger
    }
}
