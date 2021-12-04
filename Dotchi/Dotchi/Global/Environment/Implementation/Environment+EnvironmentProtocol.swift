//
//  Environment+EnvironmentProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 22/09/2021.
//

import Foundation

extension Environment: EnvironmentProtocol {
    // TODO: Set correct values
    var apiUrl: String {
        #if DEBUG
        return "portal.io"
        #else
        return "portal.io"
        #endif
    }
    
    var homepageUrl: URL {
       return URL.initWithPrefix(string: "https://schemabuoi.github.io/greg-charyszczak")!
    }
    
    var supportEmail: String {
        return "charyszczakg@gmail.com"
    }
}
