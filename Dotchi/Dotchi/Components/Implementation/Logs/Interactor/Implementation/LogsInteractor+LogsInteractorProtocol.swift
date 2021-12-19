//
//  MetricsInteractor+MetricsInteractorProtocol.swift
//  Dotchi
//
//  Created by 6rishka on 13/12/2021.
//

import Foundation

extension LogsInteractor: LogsInteractorProtocol {
    func filter(logs: [Log], keyword: String, from fromDate: Date, to toDate: Date) -> [Log] {
        var filteredLogs: [Log] = []
        logs.forEach { log in
            if (log.name.contains(keyword) || log.description.contains(keyword)) && log.timestamp >= fromDate && log.timestamp <= toDate {
                filteredLogs.append(log)
            }
        }
        return filteredLogs
    }
}
