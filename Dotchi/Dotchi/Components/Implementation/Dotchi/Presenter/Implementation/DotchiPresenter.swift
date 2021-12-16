//
//  MetricsPresenter.swift
//  Dotchi
//
//  Created by 6rishka on 13/12/2021.
//

import Foundation

class DotchiPresenter {
    weak var viewController: DotchiViewControllerProtocol?
    let interactor: DotchiInteractorProtocol
    
    let model: DotchiRouteModel
    
    init(interactor: DotchiInteractorProtocol, model: DotchiRouteModel) {
        self.interactor = interactor
        self.model = model
    }
}
