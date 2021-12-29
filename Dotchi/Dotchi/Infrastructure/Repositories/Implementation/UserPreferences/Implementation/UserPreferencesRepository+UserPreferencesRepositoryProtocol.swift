//
//  UserPreferencesRepository+UserPreferencesRepositoryProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 20/09/2021.
//

import Foundation

extension UserPreferencesRepository: UserPreferencesRepositoryProtocol {
    func getUserPreferences() -> UserPreferences {
        return storage.userPreferences
    }

    func updateApplicationLanguage(to language: Language) {
        var userPreferences = getUserPreferences()
        userPreferences.applicationLanguage = language
        storage.userPreferences = userPreferences
        logger.log(type: .info, name: "didUpdateLanguage", parameters: ["language": language.rawValue])
    }

    func updateActiveTheme(to theme: Theme) {
        var userPreferences = getUserPreferences()
        userPreferences.activeTheme = theme
        storage.userPreferences = userPreferences
        logger.log(type: .info, name: "didUpdateTheme", parameters: ["theme": theme.rawValue])
    }

    func updateAnalyticsEnabled(to isEnabled: Bool) {
        var userPreferences = getUserPreferences()
        userPreferences.isAnalyticsEnabled = isEnabled
        storage.userPreferences = userPreferences
        logger.log(type: .info, name: "didUpdateAnalytics", parameters: ["enabled": isEnabled])
    }

    func updateCrashlyticsEnabled(to isEnabled: Bool) {
        var userPreferences = getUserPreferences()
        userPreferences.isCrashlyticsEnabled = isEnabled
        storage.userPreferences = userPreferences
        logger.log(type: .info, name: "didUpdateCrashlytics", parameters: ["enabled": isEnabled])
    }
}
