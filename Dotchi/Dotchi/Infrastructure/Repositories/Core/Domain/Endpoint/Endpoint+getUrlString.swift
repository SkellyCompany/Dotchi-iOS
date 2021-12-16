//
//  Endpoints+getUrlString.swift
//  Portal
//
//  Created by Greg Charyszczak on 22/09/2021.
//

import Foundation

extension Endpoint {
    func getUrlString(with environment: EnvironmentProtocol) -> String {
        switch self {
        case .login:
            return "\(environment.apiUrl)/\(Self.loginUrl)"
        case .createAccount:
            return "\(environment.apiUrl)/\(Self.createAccountUrl)"
        case .resetPassword:
            return "\(environment.apiUrl)/\(Self.resetPasswordUrl)"
        case .dotchi(let dotchiId):
            return "\(environment.apiUrl)/\(Self.dotchiUrl)/\(dotchiId)"
        case .newLog(let dotchiId):
            return "\(environment.apiUrl)/\(Self.newLogUrl)/\(dotchiId)"
        case .updatedMetrics(let dotchiId):
            return "\(environment.apiUrl)/\(Self.updatedMetricsUrl)/\(dotchiId)"
        case .updatedStatistics(let dotchiId):
            return "\(environment.apiUrl)/\(Self.updatedStatisticsUrl)/\(dotchiId)"
        }
    }
}
