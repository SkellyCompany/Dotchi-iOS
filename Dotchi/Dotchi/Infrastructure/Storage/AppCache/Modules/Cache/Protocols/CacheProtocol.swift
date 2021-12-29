//
//  CacheProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 16/08/2021.
//

import Foundation

protocol CacheProtocol {
    associatedtype KeyType
    associatedtype ValueType

    func set(_ value: ValueType, forKey: KeyType, expirationTimeInSeconds: Int)
    func get(forKey: KeyType) -> ValueType?
}
