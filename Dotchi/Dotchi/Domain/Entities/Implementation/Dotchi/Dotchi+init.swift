//
//  Dotchi+init.swift
//  Dotchi
//
//  Created by 6rishka on 16/12/2021.
//

import Foundation

extension Dotchi {
    init(from dotchiDto: DotchiDTO) {
        self.id = dotchiDto.dotchiId
    }
}
