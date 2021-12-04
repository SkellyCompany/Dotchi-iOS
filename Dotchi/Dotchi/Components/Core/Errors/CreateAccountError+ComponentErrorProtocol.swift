//
//  CreateAccountError+ComponentError.swift
//  Portal
//
//  Created by Greg Charyszczak on 13/09/2021.
//

import Foundation

extension CreateAccountError: ComponentErrorProtocol {
    var userDescription: String {
        switch self {
        case .wrongCredentials:
            return L10n.Localizable.CreateAccountError.WrongCredentials.description
        case .connectionError:
            return L10n.Localizable.CreateAccountError.ConnectionError.description
        case .applicationError:
            return L10n.Localizable.CreateAccountError.ApplicationError.description
        case .dataSourceError:
            return L10n.Localizable.CreateAccountError.DataSourceError.description
        }
    }
}
