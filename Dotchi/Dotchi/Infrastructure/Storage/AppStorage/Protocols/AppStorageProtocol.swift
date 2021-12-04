//
//  AppStorageProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 13/09/2021.
//

import Foundation

protocol AppStorageProtocol {
    var userPreferences: UserPreferences { get set }
    var user: User? { get set }
}
