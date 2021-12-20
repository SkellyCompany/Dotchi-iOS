//
//  Log.swift
//  Dotchi
//
//  Created by 6rishka on 16/12/2021.
//

import Foundation

struct Log: Hashable {
    let id: String
    let name: String
    let description: String
    let timestamp: Date
}

extension Log {
    init(from logDto: LogDTO) {
        self.id = logDto.id
        self.name = logDto.name
        self.description = logDto.description
        self.timestamp = Date(timeIntervalSince1970: logDto.timestamp)
    }
    
    static func initMany(from logDtos: [LogDTO]) -> [Log] {
        return logDtos.map { logDto in
            return Log(id: logDto.id, name: logDto.name, description: logDto.description, timestamp: Date(timeIntervalSince1970: logDto.timestamp))
        }
    }
}
