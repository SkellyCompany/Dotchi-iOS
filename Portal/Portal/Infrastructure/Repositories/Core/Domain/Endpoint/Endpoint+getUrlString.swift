//
//  Endpoints+getUrlString.swift
//  Portal
//
//  Created by Greg Charyszczak on 22/09/2021.
//

import Foundation

extension Endpoint {
    func getUrlString(with environment: EnvironmentProtocol) -> String {
        switch self {
        case .login:
            return "\(self.getTransferType())://\(environment.apiUrl)/\(Self.loginUrl)"
        case .createAccount:
            return "\(self.getTransferType())://\(environment.apiUrl)/\(Self.createAccountUrl)"
        case .resetPassword:
            return "\(self.getTransferType())://\(environment.apiUrl)/\(Self.resetPasswordUrl)"
        }
    }
}
