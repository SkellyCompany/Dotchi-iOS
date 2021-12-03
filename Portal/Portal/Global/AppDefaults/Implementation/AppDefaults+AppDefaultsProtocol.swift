//
//  AppDefaults+AppDefaultsProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 22/09/2021.
//

import Foundation

extension AppDefaults: AppDefaultsProtocol {
    // MARK: Language
    var defaultApplicationLanguage: Language {
        let deviceLanguageCode = Locale.current.languageCode ?? defaultLanguage.rawValue
        return Language(rawValue: deviceLanguageCode) ?? defaultLanguage
    }
    
    private var defaultLanguage: Language {
        return .english
    }
    
    // MARK: Theme
    var defaultTheme: Theme {
        return .dark
    }
    
    // MARK: User Preferences
    var defaultPreferences: UserPreferences {
        return UserPreferences(applicationLanguage: self.defaultApplicationLanguage,
                               activeTheme: self.defaultTheme,
                               isAnalyticsEnabled: false,
                               isCrashlyticsEnabled: false)
    }
}
