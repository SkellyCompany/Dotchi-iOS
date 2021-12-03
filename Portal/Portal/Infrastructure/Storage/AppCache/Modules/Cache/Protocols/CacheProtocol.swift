//
//  CacheProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 16/08/2021.
//

import Foundation

protocol CacheProtocol {
    associatedtype keyType
    associatedtype valueType

    func set(_ value: valueType, forKey: keyType, expirationTimeInSeconds: Int)
    func get(forKey: keyType) -> valueType?
}
