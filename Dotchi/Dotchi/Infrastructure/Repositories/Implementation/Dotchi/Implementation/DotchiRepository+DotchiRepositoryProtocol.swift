//
//  DotchiRepository+DotchiRepositoryProtocol.swift
//  Dotchi
//
//  Created by 6rishka on 16/12/2021.
//r

import Foundation

extension DotchiRepository: DotchiRepositoryProtocol {
    func getDotchi(id: String, completionHandler: @escaping DotchiResultCallback) {
        service.get(response: DotchiDTO.self, endpointUrl: Endpoint.login.getUrlString(with: environment)) { result in
            switch result {
            case .success(let dotchiDto):
                let dotchi = Dotchi(from: dotchiDto)
                self.logger.log(type: .info, name: "successfullyFetchedDotchi")
                completionHandler(.success(dotchi))
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
