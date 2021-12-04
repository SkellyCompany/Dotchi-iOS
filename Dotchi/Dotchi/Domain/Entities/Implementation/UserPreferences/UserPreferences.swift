//
//  UserPreferences.swift
//  Portal
//
//  Created by Greg Charyszczak on 22/10/2020.
//

import Foundation

struct UserPreferences: AppStorable {
    var applicationLanguage: Language
    var activeTheme: Theme
    var isAnalyticsEnabled: Bool
    var isCrashlyticsEnabled: Bool
}
