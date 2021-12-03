//
//  LoginError+ComponentErrorProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 13/09/2021.
//

import Foundation

extension LoginError: ComponentErrorProtocol {
    var userDescription: String {
        switch self {
        case .invalidCredentials:
            return L10n.Localizable.LoginError.InvalidCredentials.description
        case .connectionError:
            return L10n.Localizable.LoginError.ConnectionError.description
        case .applicationError:
            return L10n.Localizable.LoginError.ApplicationError.description
        case .dataSourceError:
            return L10n.Localizable.LoginError.DataSourceError.description
        }
    }
}
