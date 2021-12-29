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
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
