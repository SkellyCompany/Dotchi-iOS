//
//  SceneDelegate.swift
//  Portal
//
//  Created by Greg Charyszczak on 01/09/2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private lazy var app: AppProtocol = App.shared

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let window: UIWindow = {
            let window = UIWindow(frame: windowScene.coordinateSpace.bounds)
            window.windowScene = windowScene
            return window
        }()
        self.window = window
        app.willConnect(with: window)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        app.didDisconnect()
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        app.didBecomeActive()
    }

    func sceneWillResignActive(_ scene: UIScene) {
        app.willResignActive()
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        app.willEnterForeground()
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        app.didEnterBackground()
    }
}
