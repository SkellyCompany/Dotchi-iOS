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
