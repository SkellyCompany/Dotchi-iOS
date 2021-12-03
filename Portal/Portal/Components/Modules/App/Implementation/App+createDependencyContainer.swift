//
//  App+setupDependencyContainer.swift
//  Portal
//
//  Created by 6rishka on 02/12/2021.
//

import Foundation
import SwiftyFeatureControllers
import SwiftyCommunicationServices
import Swinject
import SwiftyCryptor
import SwiftyLogger

extension App {
    func createDependencyContainer() {
        var container = Container()
        container = setupGlobals(container: container)
        container = setupRouter(container: container)
        
        container = setupLogger(container: container)
        container = setupCryptor(container: container)
        container = setupCommunicationServices(container: container)
        container = setupFeatureControllers(container: container)
        
        container = setupStorage(container: container)
        container = setupRepositories(container: container)
        container = setupComponents(container: container)
        self.container = container
    }
    
    private func setupGlobals(container: Container) -> Container {
        container.register(EnvironmentProtocol.self) { resolver in
            return Environment()
        }
        container.register(AppDefaultsProtocol.self) { resolver in
            return AppDefaults()
        }
        container.register(SystemInfoProtocol.self) { resolver in
            return SystemInfo()
        }
        return container
    }
    
    private func setupRouter(container: Container) -> Container {
        container.register(RouterProtocol.self) { resolver in
            let router = Router(container: container)
            return router
        }
        return container
    }
    
    private func setupLogger(container: Container) -> Container {
        container.register(CryptorProtocol.self) { resolver in
            return Cryptor()
        }
        return container
    }
    
    private func setupCryptor(container: Container) -> Container {
        container.register(LoggerProtocol.self) { resolver in
            let logger = Logger()
            logger.registerServices(.consoleLogger, .firebaseAnalyticsLogger)
            return logger
        }
        return container
    }
    
    private func setupCommunicationServices(container: Container) -> Container {
        container.register(HttpServiceProtocol.self) { resolver in
            return HttpService()
        }
        return container
    }
    
    private func setupFeatureControllers(container: Container) -> Container {
        container.register(LanguageControllerProtocol.self) { _ in
            return LanguageController()
        }
        container.register(PrivacyControllerProtocol.self) { _ in
            return PrivacyController()
        }
        container.register(ThemeControllerProtocol.self) { _ in
            return ThemeController()
        }
        container.register(AppTrackingControllerProtocol.self) { _ in
            return AppTrackingController()
        }
        container.register(LocationControllerProtocol.self) { _ in
            return LocationController()
        }
        container.register(PushNotificationsControllerProtocol.self) { _ in
            return PushNotificationsController()
        }
        container.register(CameraControllerProtocol.self) { _ in
            return CameraController()
        }
        return container
    }
    
    private func setupStorage(container: Container) -> Container {
        container.register(UserDefaultsProtocol.self) { _ in
            return UserDefaults()
        }
        container.register(AppStorageProtocol.self) { resolver in
            let appDefaults = resolver.resolve(AppDefaultsProtocol.self)!
            let userDefaults = resolver.resolve(UserDefaultsProtocol.self)!
            let logger = resolver.resolve(LoggerProtocol.self)!
            let cryptor = resolver.resolve(CryptorProtocol.self)!
            return AppStorage(appDefaults: appDefaults, userDefaults: userDefaults, logger: logger, cryptor: cryptor)
        }
        container.register(AppCacheProtocol.self) { _ in
            return AppCache()
        }
        return container
    }
    
    private func setupRepositories(container: Container) -> Container {
        container.register(UserPreferencesRepositoryProtocol.self) { resolver in
            let storage = resolver.resolve(AppStorageProtocol.self)!
            let logger = resolver.resolve(LoggerProtocol.self)!
            return UserPreferencesRepository(storage: storage, logger: logger)
        }
        container.register(UserRepositoryProtocol.self) { resolver in
            let storage = resolver.resolve(AppStorageProtocol.self)!
            let logger = resolver.resolve(LoggerProtocol.self)!
            return UserRepository(storage: storage, logger: logger)
        }
        container.register(AuthenticationRepositoryProtocol.self) { resolver in
            let defaults = resolver.resolve(AppDefaultsProtocol.self)!
            let environment = resolver.resolve(EnvironmentProtocol.self)!
            let storage = resolver.resolve(AppStorageProtocol.self)!
            let logger = resolver.resolve(LoggerProtocol.self)!
            let service = resolver.resolve(HttpServiceProtocol.self)!
            return AuthenticationRepository(storage: storage, defaults: defaults, environment: environment, logger: logger, service: service)
        }
        return container
    }
    
    private func setupComponents(container: Container) -> Container {
        container.register(TabBarViewController.self) { resolver in
            let router = resolver.resolve(RouterProtocol.self)!
            let eventHandler = resolver.resolve(TabBarEventHandler.self)!
            let viewController = TabBarViewController(router: router, eventHandler: eventHandler)
            return viewController
        }.implements(TabBarViewControllerProtocol.self)
        container.register(TabBarEventHandler.self) { _ in
            return TabBarPresenter()
        }.initCompleted { resolver, eventHandler in
            let presenter = eventHandler as! TabBarPresenter
            presenter.viewController = resolver.resolve(TabBarViewControllerProtocol.self)!
        }
        
        container.register(BrowseViewController.self) { _ in
            return BrowseViewController()
        }.implements(BrowseViewControllerProtocol.self)
        return container
    }
}
