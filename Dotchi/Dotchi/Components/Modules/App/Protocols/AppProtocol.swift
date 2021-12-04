//
//  AppProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 02/12/2021.
//

import UIKit

protocol AppProtocol {
    func didFinishLaunching()
    func willConnect(with window: UIWindow)
    func willEnterForeground()
    func didBecomeActive()
    func willResignActive()
    func didEnterBackground()
    func didDisconnect()
}
