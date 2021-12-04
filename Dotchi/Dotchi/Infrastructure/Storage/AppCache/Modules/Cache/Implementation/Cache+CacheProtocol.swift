//
//  Cache+CacheProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 13/09/2021.
//

import Foundation

extension Cache: CacheProtocol {
    func set(_ value: S, forKey key: T, expirationTimeInSeconds: Int = CacheItem<S>.defaultExpirationTimeInSeconds) {
        if let cachedValue = cache.object(forKey: key) {
            cachedValue.value = value
            cachedValue.expirationTimeInSeconds = expirationTimeInSeconds
            cache.setObject(cachedValue, forKey: key)
        } else {
            let newCacheItem = CacheItem<S>(expirationTimeInSeconds: expirationTimeInSeconds)
            newCacheItem.value = value
            cache.setObject(newCacheItem, forKey: key)
        }
    }
    
    func get(forKey key: T) -> S? {
        return cache.object(forKey: key)?.value
    }
}
