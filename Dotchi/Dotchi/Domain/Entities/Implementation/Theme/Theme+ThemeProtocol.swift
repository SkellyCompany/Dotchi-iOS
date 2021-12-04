//
//  Theme+ThemeProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 07/10/2021.
//

import UIKit

extension Theme {
    var interfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .dark:
            return .dark
        case .light:
            return .light
        case .system:
            return .unspecified
        }
    }
}
