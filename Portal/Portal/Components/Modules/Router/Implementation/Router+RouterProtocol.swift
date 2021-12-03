//
//  Router+RouterProtocol.swift
//  Portal
//
//  Created by 6rishka on 02/12/2021.
//

import UIKit

extension Router: RouterProtocol {
    func route(to route: Route, style: PresentationStyle) {
        switch route {
        case .tabBar:
            let viewController = container.resolve(TabBarViewController.self)!
            self.route(as: viewController, style: style)
        case .browse:
            let viewController = container.resolve(BrowseViewController.self)!
            self.route(as: viewController, style: style)
        }
    }
    
    private func route(as viewController: UIViewController, style: PresentationStyle) {
        switch style {
        case .root(let window):
            window.rootViewController = viewController
            window.makeKeyAndVisible()
        case .navigation(let navigationController):
            navigationController.pushViewController(viewController, animated: true)
        case .modal(let sender):
            sender.present(viewController, animated: true, completion: nil)
        case .embed(let tabBarController, let tabBarItem):
            viewController.tabBarItem = tabBarItem
            tabBarController.viewControllers?.append(viewController)
        }
    }
}
