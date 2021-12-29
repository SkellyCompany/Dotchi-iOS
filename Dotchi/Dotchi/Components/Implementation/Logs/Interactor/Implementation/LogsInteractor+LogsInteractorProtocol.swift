//
//  MetricsInteractor+MetricsInteractorProtocol.swift
//  Dotchi
//
//  Created by 6rishka on 13/12/2021.
//

import Foundation

extension LogsInteractor: LogsInteractorProtocol {
    func filter(logs: [Log], keyword: String) -> [Log] {
        guard !keyword.isEmpty else {
            return logs
        }
        var filteredLogs: [Log] = []
        logs.forEach { log in
            if log.name.contains(keyword) || log.description.contains(keyword) {
                filteredLogs.append(log)
            }
        }
        return filteredLogs
    }

    func filter(logs: [Log], keyword: String, from fromDate: Date, to toDate: Date) -> [Log] {
        guard !keyword.isEmpty else {
            return logs
        }
        var filteredLogs: [Log] = []
        logs.forEach { log in
            if (log.name.contains(keyword) || log.description.contains(keyword))
                && log.timestamp >= fromDate && log.timestamp <= toDate {
                filteredLogs.append(log)
            }
        }
        return filteredLogs
    }
}
