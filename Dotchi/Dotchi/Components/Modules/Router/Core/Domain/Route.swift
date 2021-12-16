//
//  Routes.swift
//  Portal
//
//  Created by Greg Charyszczak on 22/09/2021.
//

import Foundation

enum Route {
    case splash
    case dotchi(model: DotchiRouteModel)
    case metrics(model: MetricsRouteModel)
    case logs(model: LogsRouteModel)
}
