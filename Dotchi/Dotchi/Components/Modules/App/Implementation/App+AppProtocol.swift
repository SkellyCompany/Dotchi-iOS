//
//  App+AppProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 02/12/2021.
//

import UIKit

extension App: AppProtocol {
    func didFinishLaunching() {
        createDependencyContainer()
        resolveDependencies()

        setupLanguage()
        setupPrivacy()
        setupFirebase()
        setupSwiftyKit()
    }

    func willConnect(with window: UIWindow) {
        setupTheme(in: [window])
        setupTint(in: window)
        launch(in: window)
    }

    func willEnterForeground() {

    }

    func didBecomeActive() {

    }

    func willResignActive() {

    }

    func didEnterBackground() {

    }

    func didDisconnect() {

    }
}
