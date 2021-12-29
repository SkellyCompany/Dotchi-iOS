//
//  EnvironmentProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 22/09/2021.
//

import Foundation

protocol EnvironmentProtocol {
    var apiUrl: String { get }

    var homepageUrl: URL { get }

    var supportEmail: String { get }
}
