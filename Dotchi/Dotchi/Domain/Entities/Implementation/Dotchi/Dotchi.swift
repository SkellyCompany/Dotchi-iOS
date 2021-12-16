//
//  Dotchi.swift
//  Dotchi
//
//  Created by 6rishka on 16/12/2021.
//

import Foundation

struct Dotchi {
    let id: String
    let statistics: DotchiStatistics
    let metrics: DotchiMetrics
}

extension Dotchi {
    init(from dto: DotchiDTO) {
        self.id = dto.dotchiId
        self.metrics = DotchiMetrics(from: dto.metrics)
        self.statistics = DotchiStatistics(from: dto.statistics)
    }
}
