//
//  DataError+ComponentErrorProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 13/09/2021.
//

import Foundation

extension DataError: ComponentErrorProtocol {
    var userDescription: String {
        switch self {
        case .connectionError:
            return L10n.Localizable.DataError.ConnectionError.description
        case .applicationError:
            return L10n.Localizable.DataError.ApplicationError.description
        case .dataSourceError:
            return L10n.Localizable.DataError.DataSourceError.description
        case .emptyData:
            return L10n.Localizable.DataError.EmptyData.description
        }
    }
}
