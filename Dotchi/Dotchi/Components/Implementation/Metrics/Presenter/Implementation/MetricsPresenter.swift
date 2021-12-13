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
    
    init(interactor: MetricsInteractorProtocol) {
        self.interactor = interactor
    }
}
