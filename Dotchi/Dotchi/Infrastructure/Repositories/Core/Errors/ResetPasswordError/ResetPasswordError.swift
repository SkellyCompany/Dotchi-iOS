//
//  ResetPasswordError.swift
//  Portal
//
//  Created by Greg Charyszczak on 08/09/2021.
//

import Foundation
import SwiftyCommunicationServices

enum ResetPasswordError {
    case invalidEmail
    case applicationError
    case dataSourceError
    case connectionError
}

extension ResetPasswordError {
    // swiflint:disable cyclomatic_complexity
    init(error: Error?) {
        if let httpServiceError = error as? HttpServiceError {
            switch httpServiceError {
            case .createRequestError, .parseError, .unknown, .refreshTokenError, .invalidToken:
                self = .applicationError
            case .performRequestError(let performRequestError):
                switch performRequestError {
                case .httpError(let statusCode, _, _):
                    if statusCode == 400 {
                        self = .invalidEmail
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
    // swiflint:enable cyclomatic_complexity
}
