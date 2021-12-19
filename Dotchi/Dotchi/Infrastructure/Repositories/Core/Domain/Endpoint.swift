//
//  Endpoint.swift
//  Portal
//
//  Created by Greg Charyszczak on 22/09/2021.
//

import Foundation

enum Endpoint {
    static let loginUrl = "authenticate"
    static let createAccountUrl = "register"
    static let resetPasswordUrl = "user/forgot-password"
    
    static let dotchiUrl = "dotchi"
    static let logUrl = "log"
    static let newLogUrl = "newLog"
    static let updatedMetricsUrl = "updatedMetrics"
    static let updatedStatisticsUrl = "updatedStatistics"
    
    case login
    case createAccount
    case resetPassword
    
    case dotchi(dotchiId: String)
    case log(dotchiId: String)
    case newLog(dotchiId: String)
    case updatedMetrics(dotchiId: String)
    case updatedStatistics(dotchiId: String)
}

extension Endpoint {
    func getUrlString(with environment: EnvironmentProtocol) -> String {
        switch self {
        case .login:
            return "\(environment.apiUrl)/\(Self.loginUrl)"
        case .createAccount:
            return "\(environment.apiUrl)/\(Self.createAccountUrl)"
        case .resetPassword:
            return "\(environment.apiUrl)/\(Self.resetPasswordUrl)"
        case .log(let dotchiId):
            return "\(environment.apiUrl)/\(Self.logUrl)/\(dotchiId)"
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
