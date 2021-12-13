//
//  MetricsInteractor.swift
//  Dotchi
//
//  Created by 6rishka on 13/12/2021.
//

import Foundation

class MetricsInteractor {
    let entityGateway: MetricsEntityGatewayProtocol
    
    init(entityGateway: MetricsEntityGatewayProtocol) {
        self.entityGateway = entityGateway
    }
}
