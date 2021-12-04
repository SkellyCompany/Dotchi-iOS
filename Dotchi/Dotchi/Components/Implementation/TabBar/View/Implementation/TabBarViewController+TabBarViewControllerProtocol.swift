//
//  TabBarViewController+TabBarViewControllerProtocol.swift
//  Portal
//
//  Created by 6rishka on 02/12/2021.
//

import Foundation
import UIKit

extension TabBarViewController: TabBarViewControllerProtocol {
    func embedViewControllers() {
        let dotchiTabBarItem = UITabBarItem(title: "Browse", image: UIImage(systemName: "pawprint"), selectedImage: UIImage(systemName: "pawprint.fill"))
        let metricsTabBarItem = UITabBarItem(title: "Metrics", image: UIImage(systemName: "chart.bar"), selectedImage: UIImage(systemName: "chart.bar.fill"))
        let logsTabBarItem = UITabBarItem(title: "Logs", image: UIImage(systemName: "doc.badge.gearshape"), selectedImage: UIImage(systemName: "doc.badge.gearshape.fill"))
        
        router.route(to: .dotchi, style: .embed(tabBarController: self, tabBarItem: dotchiTabBarItem))
        router.route(to: .metrics, style: .embed(tabBarController: self, tabBarItem: metricsTabBarItem))
        router.route(to: .logs, style: .embed(tabBarController: self, tabBarItem: logsTabBarItem))
    }
}
