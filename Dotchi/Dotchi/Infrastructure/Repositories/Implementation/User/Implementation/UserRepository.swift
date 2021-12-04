//
//  UserRepository.swift
//  Portal
//
//  Created by Greg Charyszczak on 14/06/2021.
//

import Foundation
import SwiftyLogger

class UserRepository {
    var storage: AppStorageProtocol
    let logger: LoggerProtocol
    
    init(storage: AppStorageProtocol, logger: LoggerProtocol) {
        self.storage = storage
        self.logger = logger
    }
}
