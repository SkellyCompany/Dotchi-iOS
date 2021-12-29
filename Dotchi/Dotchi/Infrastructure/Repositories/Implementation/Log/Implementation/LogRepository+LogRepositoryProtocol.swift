//
//  LogRepository+LogRepositoryProtocol.swift
//  Dotchi
//
//  Created by 6rishka on 16/12/2021.
//

import Foundation

extension LogRepository: LogRepositoryProtocol {
    func getAllLogs(dotchiId: String, completionHandler: @escaping LogsResultCallback) {
        httpService.get(response: [LogDTO].self,
                        endpointUrl: Endpoint.log(dotchiId: dotchiId).getUrlString(with: environment)) { result in
            switch result {
            case .success(let logDto):
                let logs = Log.initMany(from: logDto)
                self.logger.log(type: .info, name: "successfullyFetchedDotchi")
                completionHandler(.success(logs))
                return
            case .failure(let httpServiceError):
                let dataError = DataError(error: httpServiceError)
                self.logger.log(type: .info, name: "couldNotFetchDotchi")
                completionHandler(.failure(dataError))
                return
            }
        }
    }
}
