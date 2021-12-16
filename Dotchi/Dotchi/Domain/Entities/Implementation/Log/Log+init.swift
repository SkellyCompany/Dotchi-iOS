//
//  Log+init.swift
//  Dotchi
//
//  Created by 6rishka on 16/12/2021.
//

import Foundation

extension Log {
    init(from logDto: LogDTO) {
        self.name = logDto.name
        self.description = logDto.description
    }
    
    static func initMany(from logDtos: [LogDTO]) -> [Log] {
        return logDtos.map { logDto in
            return Log(name: logDto.name, description: logDto.description)
        }
    }
}