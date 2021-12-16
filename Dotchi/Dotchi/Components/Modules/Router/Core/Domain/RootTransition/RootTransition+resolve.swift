//
//  RootTransition+resolve.swift
//  Portal
//
//  Created by 6rishka on 16/12/2021.
//

import Foundation
import UIKit

extension RootTransition {
    func resolve() -> UIView.AnimationOptions? {
        switch self {
        case .crossDisolve:
            return .transitionCrossDissolve
        case .flipToLeft:
            return .transitionFlipFromRight
        case .flipToRight:
            return .transitionFlipFromLeft
        }
    }
}
