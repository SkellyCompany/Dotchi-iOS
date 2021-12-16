//
//  MetricsRepository.swift
//  Dotchi
//
//  Created by 6rishka on 13/12/2021.
//

import Foundation
import SwiftyCommunicationServices

class MetricsRepository {
    let service: WebSocketServiceProtocol
    
    init(service: WebSocketServiceProtocol) {
        self.service = service
    }
}
