//
//  DotchiDTO.swift
//  Dotchi
//
//  Created by 6rishka on 16/12/2021.
//

import Foundation

struct DotchiDTO: DTO {
    private enum CodingKeys: String, CodingKey {
        case dotchiId = "dotchi_id", statistics, metrics
    }

    let dotchiId: String
    let statistics: DotchiStatisticsDTO
    let metrics: DotchiMetricsDTO
}
