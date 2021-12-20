//
//  MetricsPresenter+MetricsEventHandlerProtocol.swift
//  Dotchi
//
//  Created by 6rishka on 13/12/2021.
//

import Foundation

extension LogsPresenter: LogsEventHandlerProtocol {
    func didEnterSearch(text: String) {
        self.filteredLogs = interactor.filter(logs: logs, keyword: text)
        refreshViewModel()
    }
}
