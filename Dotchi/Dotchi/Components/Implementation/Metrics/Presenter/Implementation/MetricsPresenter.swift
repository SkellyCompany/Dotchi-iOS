//
//  MetricsPresenter.swift
//  Dotchi
//
//  Created by 6rishka on 13/12/2021.
//

import Foundation

class MetricsPresenter {
    weak var viewController: MetricsViewControllerProtocol?
    let interactor: MetricsInteractorProtocol
    
    let model: MetricsRouteModel
    
    init(interactor: MetricsInteractorProtocol, model: MetricsRouteModel) {
        self.interactor = interactor
        self.model = model
    }
}
