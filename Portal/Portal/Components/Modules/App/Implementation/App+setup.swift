//
//  App+setup.swift
//  Portal
//
//  Created by 6rishka on 02/12/2021.
//

import UIKit
import SwiftyLogger
import SwiftyKit
import Firebase

extension App {
    func setupLanguage() {
        guard let languageController = languageController,
              let userPreferencesRepository = userPreferencesRepository else { return }
        let preferences = userPreferencesRepository.getUserPreferences()
        languageController.switchApplicationLanguage(to: preferences.applicationLanguage.code, localizableBundle: &L10n.bundle)
    }
    
    func setupPrivacy() {
        guard let privacyController = privacyController,
              let appTrackingController = appTrackingController,
              let userPreferencesRepository = userPreferencesRepository else { return }
        let preferences = userPreferencesRepository.getUserPreferences()
        appTrackingController.checkPermissionStatus() { status in
            switch status {
            case .authorized:
                privacyController.switchAnalyticsEnabled(to: preferences.isAnalyticsEnabled)
                privacyController.switchCrashlyticsEnabled(to: preferences.isCrashlyticsEnabled)
            case .notDetermined, .denied, .restricted:
                privacyController.switchAnalyticsEnabled(to: false)
                privacyController.switchCrashlyticsEnabled(to: false)
            }
        }
    }
    
    func setupTheme(in windows: [UIWindow]) {
        guard let themeController = themeController,
              let userPreferencesRepository = userPreferencesRepository else { return }
        themeController.switchActiveTheme(to: userPreferencesRepository.getUserPreferences().activeTheme.interfaceStyle, in: windows)
    }
    
    func setupFirebase() {
        FirebaseApp.configure()
    }
    
    func setupSwiftyKit() {
        ResourcesProvider.update(resources: Resources())
    }
}
