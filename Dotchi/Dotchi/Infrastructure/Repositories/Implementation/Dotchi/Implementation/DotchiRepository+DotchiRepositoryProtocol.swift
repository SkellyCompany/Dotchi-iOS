//
//  DotchiRepository+DotchiRepositoryProtocol.swift
//  Dotchi
//
//  Created by 6rishka on 16/12/2021.
//r

import Foundation

extension DotchiRepository: DotchiRepositoryProtocol {
    func getDotchi(id: String, completionHandler: @escaping DotchiResultCallback) {
        httpService.get(response: DotchiDTO.self, endpointUrl: Endpoint.dotchi(dotchiId: id).getUrlString(with: environment)) { result in
            switch result {
            case .success(let dotchiDto):
                let dotchi = Dotchi(from: dotchiDto)
                self.logger.log(type: .info, name: "successGetDotchi")
                completionHandler(.success(dotchi))
                return
            case .failure(let httpServiceError):
                let dataError = DataError(error: httpServiceError)
                self.logger.log(type: .info, name: "failureGetDotchi")
                completionHandler(.failure(dataError))
                return
            }
        }
    }
    
    func observeStatistics(dotchiId: String, completionHandler: @escaping StatisticsResultCallback) {
        socketService.on(.custom(name: Endpoint.updatedStatistics(dotchiId: dotchiId).getEventString()), with: DotchiStatisticsDTO.self, in: .json, completionHandler: { result in
            switch result {
            case .success(let dotchiStatisticsDto):
                let statistics = DotchiStatistics(from: dotchiStatisticsDto)
                self.logger.log(type: .info, name: "successDotchiStatisticsUpdate")
                completionHandler(.success(statistics))
                return
            case .failure(let webSocketServiceError):
                let dataError = DataError(error: webSocketServiceError)
                self.logger.log(type: .info, name: "failureDotchiStatisticsUpdate")
                completionHandler(.failure(dataError))
                return
            }
        })
    }
    
    func observeMetrics(dotchiId: String, completionHandler: @escaping MetricsResultCallback) {
        socketService.on(.custom(name: Endpoint.updatedMetrics(dotchiId: dotchiId).getEventString()), with: DotchiMetricsDTO.self, in: .json, completionHandler: { result in
            switch result {
            case .success(let dotchiMetricsDto):
                let statistics = DotchiMetrics(from: dotchiMetricsDto)
                self.logger.log(type: .info, name: "successDotchiMetricsUpdate")
                completionHandler(.success(statistics))
                return
            case .failure(let webSocketServiceError):
                let dataError = DataError(error: webSocketServiceError)
                self.logger.log(type: .info, name: "failureDotchiMetricsUpdate")
                completionHandler(.failure(dataError))
                return
            }
        })
    }
}
