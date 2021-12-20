//
//  MetricsPresenter.swift
//  Dotchi
//
//  Created by 6rishka on 13/12/2021.
//

import Foundation

class DotchiPresenter {
    let interactor: DotchiInteractorProtocol
    weak var viewController: DotchiViewControllerProtocol? {
        didSet {
            refreshViewModel()
        }
    }
    
    let dotchi: Dotchi
    
    var statistics: DotchiStatistics
    var metrics: DotchiMetrics
    
    init(interactor: DotchiInteractorProtocol, routeModel: DotchiRouteModel) {
        self.interactor = interactor
        self.dotchi = routeModel.dotchi
        self.statistics = routeModel.dotchi.statistics
        self.metrics = routeModel.dotchi.metrics
        observeStatistics()
        observeMetrics()
    }
}

extension DotchiPresenter {
    func refreshViewModel() {
        let viewModel = DotchiViewModel(statistics: statistics, metrics: metrics)
        viewController?.model = viewModel
    }
}

extension DotchiPresenter {
    func observeStatistics() {
        interactor.observeStatistics(dotchiId: dotchi.id) { result in
            if case let Result.success(statistics) = result {
                self.statistics = statistics
                self.refreshViewModel()
            }
        }
    }
    
    func observeMetrics() {
        interactor.observeMetrics(dotchiId: dotchi.id) { result in
            if case let Result.success(metrics) = result {
                self.metrics = metrics
                self.refreshViewModel()
            }
        }
    }
}
