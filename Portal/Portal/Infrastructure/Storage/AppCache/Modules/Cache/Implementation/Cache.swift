//
//  Cache.swift
//  Portal
//
//  Created by Greg Charyszczak on 16/08/2021.
//

import Foundation

class Cache<T: AnyObject, S: AnyObject> {
    typealias keyType = T
    typealias valueType = S

    let cache: NSCache<T, CacheItem<S>> = NSCache<T, CacheItem<S>>()
}
