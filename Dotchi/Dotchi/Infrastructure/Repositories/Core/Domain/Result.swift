//
//  Result.swift
//  Portal
//
//  Created by Greg Charyszczak on 15/09/2021.
//

import Foundation

enum Result<T: DataErrorProtocol> {
    case success
    case failure(_ error: T)
}
