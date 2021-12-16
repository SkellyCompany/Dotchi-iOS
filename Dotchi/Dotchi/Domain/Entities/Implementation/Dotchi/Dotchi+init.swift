//
//  Dotchi+init.swift
//  Dotchi
//
//  Created by 6rishka on 16/12/2021.
//

import Foundation

extension Dotchi {
    init(from dto: DotchiDTO) {
        self.id = dto.dotchiId
        self.metrics = DotchiMetrics(from: dto.metrics)
        self.statistics = DotchiStatistics(from: dto.statistics)
    }
}
