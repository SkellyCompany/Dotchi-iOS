//
//  MetricsInteractor.swift
//  Dotchi
//
//  Created by 6rishka on 13/12/2021.
//

import Foundation

class DotchiInteractor {
    let repository: DotchiRepositoryProtocol

    init(repository: DotchiRepositoryProtocol) {
        self.repository = repository
    }
}
