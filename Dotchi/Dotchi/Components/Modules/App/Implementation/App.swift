//
//  App.swift
//  Portal
//
//  Created by Greg Charyszczak on 02/12/2021.
//

import Foundation
import Swinject
import SwiftyFeatureControllers

class App {
    static let shared = App()
    
    var container: Container?
    var router: RouterProtocol?
    var languageController: LanguageControllerProtocol?
    var privacyController: PrivacyControllerProtocol?
    var themeController: ThemeControllerProtocol?
    var appTrackingController: AppTrackingControllerProtocol?
    var userPreferencesRepository: UserPreferencesRepositoryProtocol?
    
    private init() {
        
    }
}
