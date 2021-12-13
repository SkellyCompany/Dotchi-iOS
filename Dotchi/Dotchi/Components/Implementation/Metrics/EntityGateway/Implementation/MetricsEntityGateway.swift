//
//  MetricsEntityGateway.swift
//  Dotchi
//
//  Created by 6rishka on 13/12/2021.
//

import Foundation

class MetricsEntityGateway {
    let repository: MetricRepositoryProtocol
    
    init(repository: MetricRepositoryProtocol) {
        self.repository = repository
        print("Testing websockets...")
    }
}
