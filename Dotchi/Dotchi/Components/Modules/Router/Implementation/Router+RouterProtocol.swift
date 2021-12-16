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
            case .wrapInTabBar(let tabBarItem, let viewControllers):
                let tabBar = container.resolve(TabBarController.self)!
                let navigation = container.resolve(NavigationController.self)!
                viewController.tabBarItem = tabBarItem
                navigation.viewControllers = [viewController]
                tabBar.viewControllers = [navigation]
                viewControllers?.forEach { route, tabBarItem in
                    let navigation = container.resolve(NavigationController.self)!
                    let vc = resolveViewController(for: route)
                    vc.tabBarItem = tabBarItem
                    navigation.viewControllers = [vc]
                    tabBar.viewControllers?.append(navigation)
                }
                viewController = tabBar
            }
        }
        self.route(to: viewController, style: style)
    }
    
    private func resolveViewController(for route: Route) -> UIViewController {
        switch route {
        case .splash:
            return container.resolve(SplashViewController.self)!
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
        case .root(let window, let transition):
            window.rootViewController = viewController
            window.makeKeyAndVisible()
            UIView.transition(with: window, duration: 0.75, options: transition?.resolve() ?? [], animations: {})
        case .navigation(let navigationController):
            navigationController.pushViewController(viewController, animated: true)
        case .modal(let sender):
            sender.present(viewController, animated: true, completion: nil)
        }
    }
}
