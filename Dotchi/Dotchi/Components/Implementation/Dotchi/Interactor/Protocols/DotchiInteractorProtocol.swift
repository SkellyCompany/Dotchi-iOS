//
//  MetricsInteractorProtocol.swift
//  Dotchi
//
//  Created by 6rishka on 13/12/2021.
//

import Foundation

protocol DotchiInteractorProtocol {
    typealias StatisticsResultCallback = (Result<DotchiStatistics, DataError>) -> Void
    typealias MetricsResultCallback = (Result<DotchiMetrics, DataError>) -> Void
    
    func observeStatistics(dotchiId: String, completionHandler: @escaping StatisticsResultCallback)
    func observeMetrics(dotchiId: String, completionHandler: @escaping MetricsResultCallback)
}
