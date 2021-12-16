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
    
    let routeModel: LogsRouteModel
    
    init(interactor: LogsInteractorProtocol, routeModel: LogsRouteModel) {
        self.interactor = interactor
        self.routeModel = routeModel
    }
}

extension LogsPresenter {
    func refreshViewModel() {
        let viewModel = LogsViewModel(logs: routeModel.logs)
        viewController?.model = viewModel
    }
}
