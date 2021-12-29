//
//  LogRepositoryProtocol.swift
//  Dotchi
//
//  Created by 6rishka on 16/12/2021.
//

import Foundation

public typealias LogsResultCallback = (Result<[Log], DataError>) -> Void
public typealias LogResultCallback = (Result<Log, DataError>) -> Void

public protocol LogRepositoryProtocol {
    func getAllLogs(dotchiId: String, completionHandler: @escaping LogsResultCallback)
}
