//
//  MetricsInteractor.swift
//  Dotchi
//
//  Created by 6rishka on 13/12/2021.
//

import Foundation

class MetricsInteractor {
    let repository: MetricsRepositoryProtocol
    
    init(repository: MetricsRepositoryProtocol) {
        self.repository = repository
    }
}
