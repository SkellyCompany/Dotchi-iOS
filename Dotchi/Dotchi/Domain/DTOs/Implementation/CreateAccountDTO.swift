//
//  CreateAccountModel.swift
//  Portal
//
//  Created by Greg Charyszczak on 08/09/2021.
//

import Foundation

struct CreateAccountDTO: DTO {
    private enum CodingKeys : String, CodingKey {
        case email, firstName = "first_name", lastName = "last_name", password
    }

    let email: String
    let firstName: String
    let lastName: String
    let password: String
}
