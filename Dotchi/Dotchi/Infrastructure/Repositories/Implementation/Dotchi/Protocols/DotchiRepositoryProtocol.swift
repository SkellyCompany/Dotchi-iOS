//
//  DotchiRepositoryProtocol.swift
//  Dotchi
//
//  Created by 6rishka on 16/12/2021.
//

import Foundation

protocol DotchiRepositoryProtocol {
    typealias DotchiResultCallback = (Result<Dotchi, DataError>) -> Void
    typealias StatisticsResultCallback = (Result<DotchiStatistics, DataError>) -> Void
    typealias MetricsResultCallback = (Result<DotchiMetrics, DataError>) -> Void

    func getDotchi(id: String, completionHandler: @escaping DotchiResultCallback)
    func observeStatistics(dotchiId: String, completionHandler: @escaping StatisticsResultCallback)
    func observeMetrics(dotchiId: String, completionHandler: @escaping MetricsResultCallback)
}
