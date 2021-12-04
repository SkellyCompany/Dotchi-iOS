//
//  UserPreferencesRepositoryProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 22/10/2020.
//

import Foundation
import SwiftyFeatureControllers

protocol UserPreferencesRepositoryProtocol {
    func getUserPreferences() -> UserPreferences
    func updateApplicationLanguage(to language: Language)
    func updateActiveTheme(to theme: Theme)
    func updateAnalyticsEnabled(to isEnabled: Bool)
    func updateCrashlyticsEnabled(to isEnabled: Bool)
}
