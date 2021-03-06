//
//  RouterProtocol.swift
//  Portal
//
//  Created by 6rishka on 02/12/2021.
//

import Foundation
import UIKit

protocol RouterProtocol {
    func route(to route: Route, style: PresentationStyle, options: [RoutingOption]?)
}

extension RouterProtocol {
    func route(to route: Route, style: PresentationStyle) {
        self.route(to: route, style: style, options: nil)
    }
}
