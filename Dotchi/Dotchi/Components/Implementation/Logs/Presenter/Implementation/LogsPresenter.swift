//
//  MetricsPresenter.swift
//  Dotchi
//
//  Created by 6rishka on 13/12/2021.
//

import Foundation

class LogsPresenter {
    weak var viewController: LogsViewControllerProtocol?
    let interactor: LogsInteractorProtocol
    
    let model: LogsRouteModel
    
    init(interactor: LogsInteractorProtocol, model: LogsRouteModel) {
        self.interactor = interactor
        self.model = model
    }
}
