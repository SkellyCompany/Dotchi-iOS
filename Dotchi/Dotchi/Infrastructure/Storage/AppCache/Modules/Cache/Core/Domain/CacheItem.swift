//
//  CacheItem.swift
//  Portal
//
//  Created by Greg Charyszczak on 16/08/2021.
//

import Foundation

class CacheItem<T: AnyObject> {
    static var defaultExpirationTimeInSeconds: Int {
        return Int.max
    }

    var expirationTimeInSeconds: Int

    private var lastRefreshTimestamp: TimeInterval?
    private var _value: T?

    var value: T? {
        set {
            self.lastRefreshTimestamp = NSDate().timeIntervalSince1970
            _value = newValue
        }
        get {
            if let lastRefreshTimestamp = lastRefreshTimestamp,
               Int(NSDate().timeIntervalSince1970) - Int(lastRefreshTimestamp) < expirationTimeInSeconds {
                return _value

            } else {
                return nil
            }
        }
    }

    // MARK: Initialization
    init() {
        self.expirationTimeInSeconds = Self.defaultExpirationTimeInSeconds
    }

    init(expirationTimeInSeconds: Int) {
        self.expirationTimeInSeconds = expirationTimeInSeconds
    }
}
