//
//  InitializationError+init.swift
//  Portal
//
//  Created by Greg Charyszczak on 20/09/2021.
//

import Foundation

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
