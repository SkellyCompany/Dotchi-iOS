//
//  RootTransition.swift
//  Portal
//
//  Created by 6rishka on 16/12/2021.
//

import Foundation
import UIKit

enum RootTransition {
    case crossDisolve
    case flipToRight
    case flipToLeft
}

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
