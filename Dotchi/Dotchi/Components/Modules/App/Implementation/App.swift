//
//  App.swift
//  Portal
//
//  Created by Greg Charyszczak on 02/12/2021.
//

import Foundation
import Swinject
import SwiftyFeatureControllers
import SwiftyLogger

class App {
    static let shared = App()
    
    var container: Container?
    var router: RouterProtocol?
    var logger: LoggerProtocol?
    var languageController: LanguageControllerProtocol?
    var privacyController: PrivacyControllerProtocol?
    var themeController: ThemeControllerProtocol?
    var appTrackingController: AppTrackingControllerProtocol?
    var userPreferencesRepository: UserPreferencesRepositoryProtocol?
    var dotchiRepository: DotchiRepositoryProtocol?
    var logRepository: LogRepositoryProtocol?
    
    private init() {
        
    }
}
