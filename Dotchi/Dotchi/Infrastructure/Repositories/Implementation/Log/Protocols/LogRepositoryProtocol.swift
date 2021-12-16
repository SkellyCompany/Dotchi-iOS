//
//  LogRepositoryProtocol.swift
//  Dotchi
//
//  Created by 6rishka on 16/12/2021.
//

import Foundation

protocol LogRepositoryProtocol {
    typealias LogsResultCallback = (DataResult<[Log], DataError>) -> Void
    
    func getAllLogs(dotchiId: String, completionHandler: @escaping LogsResultCallback)
}
