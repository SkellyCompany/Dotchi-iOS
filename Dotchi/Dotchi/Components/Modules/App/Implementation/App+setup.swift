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
        let dotchiId = "C4:5B:BE:8C:60:F0"
        
        let group = DispatchGroup()
        let queue = DispatchQueue(label: "App.launch", qos: .userInteractive)
        
        var dotchi: Dotchi?
        var logs: [Log]?
        
        group.enter()
        dotchiRepository?.getDotchi(id: dotchiId) { result in
            switch result {
            case .success(let fetchedDotchi):
                dotchi = fetchedDotchi
            case .failure(let error):
                self.logger?.log(type: .error, name: "couldNotLaunch", description: error.longDescription)
            }
            group.leave()
        }
        
        group.enter()
        logRepository?.getAllLogs(dotchiId: dotchiId) { result in
            switch result {
            case .success(let fetchedLogs):
                logs = fetchedLogs
            case .failure(let error):
                self.logger?.log(type: .error, name: "couldNotLaunch", description: error.longDescription)
            }
            group.leave()
        }
        
        group.notify(queue: queue) {
            guard let dotchi = dotchi, let logs = logs else {
                self.logger?.log(type: .error, name: "couldNotLaunch")
                fatalError()
            }
            let dotchiTabBarItem = UITabBarItem(title: "Browse", image: UIImage(systemName: "pawprint"), selectedImage: UIImage(systemName: "pawprint.fill"))
            let logsTabBarItem = UITabBarItem(title: "Logs", image: UIImage(systemName: "doc.badge.gearshape"), selectedImage: UIImage(systemName: "doc.badge.gearshape.fill"))

            DispatchQueue.main.async {
                self.router?.route(to: .dotchi(model: DotchiRouteModel(dotchi: dotchi)), style: .root(window: window, transition: .flipToRight), options: [.wrapInTabBar(tabBarItem: dotchiTabBarItem, viewControllers: [
                    .logs(model: LogsRouteModel(logs: logs)) : logsTabBarItem
                ])])
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
