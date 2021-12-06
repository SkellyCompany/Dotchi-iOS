//
//  RoutingOptions.swift
//  Portal
//
//  Created by 6rishka on 04/12/2021.
//

import Foundation
import UIKit

enum RoutingOption {
    case wrapInNavigation
    case wrapInTabBar(tabBarItem: UITabBarItem, viewControllers: KeyValuePairs<Route, UITabBarItem>? = nil)
}
