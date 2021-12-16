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
    
    let routeModel: DotchiRouteModel
    
    init(interactor: DotchiInteractorProtocol, routeModel: DotchiRouteModel) {
        self.interactor = interactor
        self.routeModel = routeModel
    }
}

extension DotchiPresenter {
    func refreshViewModel() {
        let viewModel = DotchiViewModel(statistics: routeModel.dotchi.statistics)
        viewController?.model = viewModel
    }
}
