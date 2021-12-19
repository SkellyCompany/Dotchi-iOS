//
//  DotchiRepositoryProtocol.swift
//  Dotchi
//
//  Created by 6rishka on 16/12/2021.
//

import Foundation

protocol DotchiRepositoryProtocol {
    typealias DotchiResultCallback = (Result<Dotchi, DataError>) -> Void
    
    func getDotchi(id: String, completionHandler: @escaping DotchiResultCallback)
}
