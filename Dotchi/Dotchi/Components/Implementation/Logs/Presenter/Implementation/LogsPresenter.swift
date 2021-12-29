//
//  MetricsPresenter.swift
//  Dotchi
//
//  Created by 6rishka on 13/12/2021.
//

import Foundation

class LogsPresenter {
    let interactor: LogsInteractorProtocol
    weak var viewController: LogsViewControllerProtocol? {
        didSet {
            refreshViewModel()
        }
    }

    var logs: [Log]
    var filteredLogs: [Log]

    init(interactor: LogsInteractorProtocol, routeModel: LogsRouteModel) {
        self.interactor = interactor
        self.logs = routeModel.logs
        self.filteredLogs = logs
    }
}

extension LogsPresenter {
    func refreshViewModel() {
        let viewModel = LogsViewModel(logs: filteredLogs.sorted { $0.timestamp < $1.timestamp })
        viewController?.model = viewModel
    }
}
