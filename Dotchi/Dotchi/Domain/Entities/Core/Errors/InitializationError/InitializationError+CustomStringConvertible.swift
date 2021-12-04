//
//  InitializationError+CustomStringConvertible.swift
//  Portal
//
//  Created by Greg Charyszczak on 13/09/2021.
//

import Foundation

extension InitializationError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .decodingError:
            return "Decoding Error"
        case .unknown:
            return "Unknown Error"
        }
    }
}
