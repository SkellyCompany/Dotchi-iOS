//
//  TabBarViewController.swift
//  Portal
//
//  Created by 6rishka on 02/12/2021.
//

import UIKit

class TabBarController: UITabBarController {
    let router: RouterProtocol
    
    init(router: RouterProtocol) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
        
        self.tabBar.unselectedItemTintColor = UIColor.label.withAlphaComponent(0.7)
        
        embedViewControllers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TabBarController {
    func embedViewControllers() {
        let dotchiTabBarItem = UITabBarItem(title: "Browse", image: UIImage(systemName: "pawprint"), selectedImage: UIImage(systemName: "pawprint.fill"))
        let metricsTabBarItem = UITabBarItem(title: "Metrics", image: UIImage(systemName: "chart.bar"), selectedImage: UIImage(systemName: "chart.bar.fill"))
        let logsTabBarItem = UITabBarItem(title: "Logs", image: UIImage(systemName: "doc.badge.gearshape"), selectedImage: UIImage(systemName: "doc.badge.gearshape.fill"))
        
        router.route(to: .dotchi, style: .embed(tabBarController: self, tabBarItem: dotchiTabBarItem), options: [.wrapInNavigation])
        router.route(to: .metrics, style: .embed(tabBarController: self, tabBarItem: metricsTabBarItem), options: [.wrapInNavigation])
        router.route(to: .logs, style: .embed(tabBarController: self, tabBarItem: logsTabBarItem), options: [.wrapInNavigation])
    }
}

