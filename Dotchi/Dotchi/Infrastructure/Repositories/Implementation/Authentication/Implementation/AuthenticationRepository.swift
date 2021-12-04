//
//  AuthenticationRepository.swift
//  Portal
//
//  Created by Greg Charyszczak on 14/06/2021.
//

import Foundation
import SwiftyLogger
import SwiftyCommunicationServices

class AuthenticationRepository {
    var storage: AppStorageProtocol

    let defaults: AppDefaultsProtocol
    let environment: EnvironmentProtocol
    
    let logger: LoggerProtocol
    let service: HttpServiceProtocol

    let loginEndpoint: Endpoint = .login
    let createAccountEndpoint: Endpoint = .createAccount
    let resetPasswordEndpoint: Endpoint = .resetPassword
    
    init(storage: AppStorageProtocol, defaults: AppDefaultsProtocol, environment: EnvironmentProtocol, logger: LoggerProtocol, service: HttpServiceProtocol) {
        self.storage = storage
        self.defaults = defaults
        self.environment = environment
        self.logger = logger
        self.service = service
    }
}
