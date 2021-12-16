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
    
    func setupTint(in window: UIWindow) {
        window.tintColor = Asset.Colors.accent.color
    }
    
    func launch(in window: UIWindow) {
        router?.route(to: .splash, style: .root(window: window))
        //TODO: Remove hardcoded dotchi id
        dotchiRepository?.getDotchi(id: "C4:5B:BE:8C:60:F0") { result in
            switch result {
            case .success(let dotchi):
                let dotchiTabBarItem = UITabBarItem(title: "Browse", image: UIImage(systemName: "pawprint"), selectedImage: UIImage(systemName: "pawprint.fill"))
                let metricsTabBarItem = UITabBarItem(title: "Metrics", image: UIImage(systemName: "chart.bar"), selectedImage: UIImage(systemName: "chart.bar.fill"))
                let logsTabBarItem = UITabBarItem(title: "Logs", image: UIImage(systemName: "doc.badge.gearshape"), selectedImage: UIImage(systemName: "doc.badge.gearshape.fill"))

                DispatchQueue.main.async {
                    self.router?.route(to: .dotchi(model: DotchiRouteModel(dotchi: dotchi)), style: .root(window: window, transition: .flipToRight), options: [.wrapInTabBar(tabBarItem: dotchiTabBarItem, viewControllers: [
                        .metrics(model: MetricsRouteModel(dotchi: dotchi)) : metricsTabBarItem,
                        .logs(model: LogsRouteModel(dotchi: dotchi)) : logsTabBarItem
                    ])])
                }
            case .failure(let error):
                self.logger?.log(type: .error, name: "couldNotLaunch", description: error.longDescription)
                //TODO: Implement proper error handling
                fatalError()
            }
            
        }
    }
    
    func setupFirebase() {
        FirebaseApp.configure()
    }
    
    func setupSwiftyKit() {
        ResourcesProvider.update(resources: Resources())
    }
}
