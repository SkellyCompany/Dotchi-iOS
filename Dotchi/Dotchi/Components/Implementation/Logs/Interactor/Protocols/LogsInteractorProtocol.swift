//
//  MetricsInteractorProtocol.swift
//  Dotchi
//
//  Created by 6rishka on 13/12/2021.
//

import Foundation

protocol LogsInteractorProtocol {
    func filter(logs: [Log], keyword: String) -> [Log]
    func filter(logs: [Log], keyword: String, from fromDate: Date, to toDate: Date) -> [Log]
}
