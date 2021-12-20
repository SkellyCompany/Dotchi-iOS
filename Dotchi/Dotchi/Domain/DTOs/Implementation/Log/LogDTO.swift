//
//  LogDTO.swift
//  Dotchi
//
//  Created by 6rishka on 16/12/2021.
//

import Foundation

struct LogDTO: DTO {
    enum CodingKeys: String, CodingKey {
        case id = "_id", name, description, timestamp
    }
    
    let id: String
    let name: String
    let description: String
    let timestamp: Double
}
