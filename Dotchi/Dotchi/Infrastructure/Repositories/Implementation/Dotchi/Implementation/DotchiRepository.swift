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
    let httpService: HttpServiceProtocol
    let socketService: WebSocketServiceProtocol

    init(environment: EnvironmentProtocol,
         logger: LoggerProtocol,
         httpService: HttpServiceProtocol,
         socketService: WebSocketServiceProtocol) {
        self.environment = environment
        self.logger = logger
        self.httpService = httpService
        self.socketService = socketService
    }
}
