//
//  App+setupDependencies.swift
//  Portal
//
//  Created by 6rishka on 02/12/2021.
//

import Foundation
import SwiftyFeatureControllers
import SwiftyLogger

extension App {
    func resolveDependencies() {
        self.router = container?.resolve(RouterProtocol.self)!
        self.logger = container?.resolve(LoggerProtocol.self)!
        self.languageController = container?.resolve(LanguageControllerProtocol.self)!
        self.privacyController = container?.resolve(PrivacyControllerProtocol.self)!
        self.themeController = container?.resolve(ThemeControllerProtocol.self)!
        self.appTrackingController = container?.resolve(AppTrackingControllerProtocol.self)!
        self.userPreferencesRepository = container?.resolve(UserPreferencesRepositoryProtocol.self)!
        self.dotchiRepository = container?.resolve(DotchiRepositoryProtocol.self)!
        self.logRepository = container?.resolve(LogRepositoryProtocol.self)!
    }
}
