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
