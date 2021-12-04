//
//  Endpoint+getTransferType.swift
//  Portal
//
//  Created by 6rishka on 02/12/2021.
//

import Foundation

extension Endpoint {
    func getTransferType() -> TransferType {
        switch self {
        case .login:
            return .https
        case .createAccount:
            return .https
        case .resetPassword:
            return .https
        }
    }
}
