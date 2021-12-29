//
//  Environment+EnvironmentProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 22/09/2021.
//

import Foundation

extension Environment: EnvironmentProtocol {
    var apiUrl: String {
        #if DEBUG
        return "https://dotchiapi.herokuapp.com"
        #else
        return "https://dotchiapi.herokuapp.com"
        #endif
    }

    var homepageUrl: URL {
        return URL.initWithPrefix(string: "https://schemabuoi.github.io/greg-charyszczak")!
    }

    var supportEmail: String {
        return "charyszczakg@gmail.com"
    }
}
