//
//  MetricsInteractorProtocol.swift
//  Dotchi
//
//  Created by 6rishka on 13/12/2021.
//

import Foundation

protocol LogsInteractorProtocol {
    func filter(logs: [Log], keyword: String) -> [Log]
}
