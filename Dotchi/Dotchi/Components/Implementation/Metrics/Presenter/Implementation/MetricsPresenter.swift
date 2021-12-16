//
//  MetricsPresenter.swift
//  Dotchi
//
//  Created by 6rishka on 13/12/2021.
//

import Foundation

class MetricsPresenter {
    let interactor: MetricsInteractorProtocol
    weak var viewController: MetricsViewControllerProtocol? {
        didSet {
            refreshViewModel()
        }
    }
    
    let routeModel: MetricsRouteModel
    
    init(interactor: MetricsInteractorProtocol, routeModel: MetricsRouteModel) {
        self.interactor = interactor
        self.routeModel = routeModel
    }
}

extension MetricsPresenter {
    func refreshViewModel() {
        let viewModel = MetricsViewModel(metrics: routeModel.dotchi.metrics)
        viewController?.model = viewModel
    }
}
