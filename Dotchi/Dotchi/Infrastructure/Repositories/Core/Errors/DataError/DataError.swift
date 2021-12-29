//
//  LoadDataError.swift
//  Portal
//
//  Created by Greg Charyszczak on 22/10/2020.
//

import Foundation
import SwiftyCommunicationServices

public enum DataError {
    case connectionError
    case applicationError
    case dataSourceError
    case emptyData
}

extension DataError {
    init(error: Error?) {
        if let httpServiceError = error as? HttpServiceError {
            switch httpServiceError {
            case .createRequestError, .parseError, .unknown, .refreshTokenError, .invalidToken:
                self = .applicationError
            case .performRequestError(let performRequestError):
                switch performRequestError {
                case .httpError(let statusCode, _, _):
                    if statusCode < 500 {
                        self = .applicationError
                    } else {
                        self = .dataSourceError
                    }
                case .connectionError:
                    self = .connectionError
                case .invalidResponse:
                    self = .applicationError
                case .emptyResponse:
                    self = .dataSourceError
                }
            case .emptyData:
                self = .emptyData
            }
        } else if let webSocketServiceError = error as? WebSocketServiceError {
            switch webSocketServiceError {
            case .parseError, .unknown:
                self = .applicationError
            }
        } else if error is InitializationError {
            self = .applicationError
        } else {
            self = .applicationError
        }
    }
}
