//
//  PresentationStyle.swift
//  Portal
//
//  Created by 6rishka on 02/12/2021.
//

import UIKit

enum PresentationStyle {
    case navigation(navigationController: UINavigationController)
    case modal(sender: UIViewController)
    case root(window: UIWindow)
}
