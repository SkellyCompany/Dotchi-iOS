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
        let browseTabBarItem = UITabBarItem(title: "Browse", image: UIImage(systemName: "square.grid.2x2"), selectedImage: UIImage(systemName: "square.grid.2x2.fill"))
        router.route(to: .browse, style: .embed(tabBarController: self, tabBarItem: browseTabBarItem))
    }
}
