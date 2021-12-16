//
//  InitializationError.swift
//  Portal
//
//  Created by Greg Charyszczak on 15/06/2021.
//

import Foundation

enum InitializationError: Error {
    case decodingError(entityName: String, description: String)
    case unknown(description: String)
}

extension InitializationError {
    init(entityName: String, initializationError: Error) {
        if let initializationError = initializationError as? InitializationError {
            switch initializationError {
            case .decodingError:
                self = .decodingError(entityName: entityName, description: initializationError.longDescription)
            case .unknown:
                self = initializationError
            }
        } else {
            self = .unknown(description: initializationError.longDescription)
        }
    }
}
