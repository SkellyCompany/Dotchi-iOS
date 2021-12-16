//
//  DotchiRepository.swift
//  Dotchi
//
//  Created by 6rishka on 16/12/2021.
//

import Foundation
import SwiftyLogger
import SwiftyCommunicationServices

class DotchiRepository {
    let environment: EnvironmentProtocol
    let logger: LoggerProtocol
    let service: HttpServiceProtocol
    
    init(environment: EnvironmentProtocol, logger: LoggerProtocol, service: HttpServiceProtocol) {
        self.environment = environment
        self.logger = logger
        self.service = service
    }
}
