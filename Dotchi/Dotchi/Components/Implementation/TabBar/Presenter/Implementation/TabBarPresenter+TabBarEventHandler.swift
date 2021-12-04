//
//  TabBarPresenter+TabBarEventHandler.swift
//  Portal
//
//  Created by 6rishka on 02/12/2021.
//

import Foundation

extension TabBarPresenter: TabBarEventHandler {
    func didInit() {
        viewController?.embedViewControllers()
    }
}
