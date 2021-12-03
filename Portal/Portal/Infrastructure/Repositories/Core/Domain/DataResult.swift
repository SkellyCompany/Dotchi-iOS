//
//  DataResponse.swift
//  Portal
//
//  Created by Greg Charyszczak on 15/09/2021.
//

import Foundation

enum DataResult<S: OutputData, T: DataErrorProtocol> {
    case success(_ data: S)
    case failure(_ error: T)
}
