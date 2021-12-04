//
//  TabBarViewController.swift
//  Portal
//
//  Created by 6rishka on 02/12/2021.
//

import UIKit

class TabBarViewController: UITabBarController {
    let router: RouterProtocol
    let eventHandler: TabBarEventHandler
    
    init(router: RouterProtocol, eventHandler: TabBarEventHandler) {
        self.router = router
        self.eventHandler = eventHandler
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .blue
        eventHandler.didInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
