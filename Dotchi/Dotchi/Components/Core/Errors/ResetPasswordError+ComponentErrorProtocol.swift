//
//  ResetPasswordError+ComponentError.swift
//  Portal
//
//  Created by Greg Charyszczak on 13/09/2021.
//

import Foundation

extension ResetPasswordError: ComponentErrorProtocol {
    var userDescription: String {
        switch self {
        case .invalidEmail:
            return L10n.Localizable.ResetPasswordError.InvalidEmail.description
        case .connectionError:
            return L10n.Localizable.ResetPasswordError.ConnectionError.description
        case .applicationError:
            return L10n.Localizable.ResetPasswordError.ApplicationError.description
        case .dataSourceError:
            return L10n.Localizable.ResetPasswordError.DataSourceError.description
        }
    }
}
