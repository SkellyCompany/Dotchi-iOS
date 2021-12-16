//
//  LoginError.swift
//  Portal
//
//  Created by Greg Charyszczak on 17/06/2021.
//

import Foundation
import SwiftyCommunicationServices

enum LoginError {
    case invalidCredentials
    case applicationError
    case dataSourceError
    case connectionError
}

extension LoginError {
    init(error: Error?) {
        if let httpServiceError = error as? HttpServiceError {
            switch httpServiceError {
            case .createRequestError, .parseError, .unknown, .refreshTokenError, .invalidToken:
                self = .applicationError
            case .performRequestError(let performRequestError):
                switch performRequestError {
                case .httpError(let statusCode, _, _):
                    if statusCode == 400 {
                        self = .invalidCredentials
                    } else if statusCode < 500 {
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
                self = .dataSourceError
            }
        } else if error is InitializationError {
            self = .applicationError
        } else {
            self = .applicationError
        }
    }
}
