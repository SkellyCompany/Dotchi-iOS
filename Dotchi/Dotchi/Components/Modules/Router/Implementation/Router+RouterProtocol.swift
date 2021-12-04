//
//  Router+RouterProtocol.swift
//  Portal
//
//  Created by 6rishka on 02/12/2021.
//

import UIKit

extension Router: RouterProtocol {
    func route(to route: Route, style: PresentationStyle, options: [RoutingOption]?) {
        var viewController = resolveViewController(for: route)
        options?.forEach { option in
            switch option {
            case .wrapInNavigation:
                let navigation = container.resolve(NavigationController.self)!
                navigation.viewControllers = [viewController]
                viewController = navigation
            }
        }
        self.route(to: viewController, style: style)
    }
    
    private func resolveViewController(for route: Route) -> UIViewController {
        switch route {
        case .tabBar:
            return container.resolve(TabBarController.self)!
        case .dotchi:
            return container.resolve(DotchiViewController.self)!
        case .metrics:
            return container.resolve(MetricsViewController.self)!
        case .logs:
            return container.resolve(LogsViewController.self)!
        }
    }
    
    private func route(to viewController: UIViewController, style: PresentationStyle) {
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
            if tabBarController.viewControllers == nil {
                tabBarController.viewControllers = [viewController]
            } else {
                tabBarController.viewControllers?.append(viewController)
            }
        }
    }
}
