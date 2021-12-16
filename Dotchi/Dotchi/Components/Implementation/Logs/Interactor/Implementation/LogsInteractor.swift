//
//  MetricsInteractor.swift
//  Dotchi
//
//  Created by 6rishka on 13/12/2021.
//

import Foundation

class LogsInteractor {
    let repository: LogRepositoryProtocol
    
    init(repository: LogRepositoryProtocol) {
        self.repository = repository
    }
}
