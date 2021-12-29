//
//  ComponentError.swift
//  Portal
//
//  Created by Greg Charyszczak on 22/10/2020.
//

import Foundation

protocol ComponentErrorProtocol: Error {
    var userDescription: String { get }
}
