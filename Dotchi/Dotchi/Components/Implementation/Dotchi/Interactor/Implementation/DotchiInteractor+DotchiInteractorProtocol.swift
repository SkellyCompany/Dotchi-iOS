//
//  MetricsInteractor+MetricsInteractorProtocol.swift
//  Dotchi
//
//  Created by 6rishka on 13/12/2021.
//

import Foundation

extension DotchiInteractor: DotchiInteractorProtocol {
    func observeStatistics(dotchiId: String, completionHandler: @escaping StatisticsResultCallback) {
        repository.observeStatistics(dotchiId: dotchiId, completionHandler: completionHandler)
    }

    func observeMetrics(dotchiId: String, completionHandler: @escaping MetricsResultCallback) {
        repository.observeMetrics(dotchiId: dotchiId, completionHandler: completionHandler)
    }
}
