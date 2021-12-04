//
//  RouterProtocol+defaults.swift
//  Dotchi
//
//  Created by 6rishka on 04/12/2021.
//

import Foundation

extension RouterProtocol {
    func route(to route: Route, style: PresentationStyle) {
        self.route(to: route, style: style, options: nil)
    }
}
