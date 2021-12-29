//
//  SystemInfoProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 22/09/2021.
//

import Foundation

protocol SystemInfoProtocol {
    // Short app version: "major.minor.patch"
    var shortAppVersion: String { get }

    // App version with build number included
    var appVersion: String { get }

    // Friendly device name, like "iPhone 6s"
    var deviceName: String { get }
}
