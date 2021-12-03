//
//  InitializationError+LocalizedError.swift
//  Portal
//
//  Created by Greg Charyszczak on 13/09/2021.
//

import Foundation

extension InitializationError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .decodingError(let entityName, let description):
            return "Could not decode \(entityName). \(description)"
        case .unknown(let description):
            return description
        }
    }
}
