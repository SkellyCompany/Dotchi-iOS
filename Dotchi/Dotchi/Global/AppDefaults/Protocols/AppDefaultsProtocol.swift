//
//  AppDefaultsProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 22/09/2021.
//

import Foundation

protocol AppDefaultsProtocol {
    var defaultApplicationLanguage: Language { get }

    var defaultTheme: Theme { get }

    var defaultPreferences: UserPreferences { get }
}
