//
//  AuthenticationManager+AuthenticationManagerProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 20/09/2021.
//

import Foundation
import SwiftyCommunicationServices

extension AuthenticationRepository: AuthenticationRepositoryProtocol {
    func login(with loginModel: LoginDTO, completionHandler: @escaping LoginResultCallback) {
        service.post(response: UserDTO.self, endpointUrl: loginEndpoint.getUrlString(with: environment), body: loginModel) { result in
            switch result {
            case .success(let userDto):
                let user = User(from: userDto, with: loginModel.password)
                self.storage.user = user
                self.logger.log(type: .info, name: "successfullyLoggedIn")
                completionHandler(.success(user))
                return
            case .failure(let httpServiceError):
                let loginError = LoginError(error: httpServiceError)
                completionHandler(.failure(loginError))
                return
            }
        }
    }
    
    func createAccount(with createAccountModel: CreateAccountDTO, completionHandler: @escaping CreateAccountResultCallback) {
        service.post(endpointUrl: createAccountEndpoint.getUrlString(with: environment), body: createAccountModel) { result in
            switch result {
            case .success:
                self.logger.log(type: .info, name: "successfullyCreatedAccount")
                completionHandler(.success)
                return
            case .failure(let httpServiceError):
                let createAccountError = CreateAccountError(error: httpServiceError)
                completionHandler(.failure(createAccountError))
                return
            }
        }
    }
    
    func resetPassword(with resetPasswordModel: ResetPasswordDTO, completionHandler: @escaping ResetPasswordResultCallback) {
        service.post(endpointUrl: resetPasswordEndpoint.getUrlString(with: environment), body: resetPasswordModel) { result in
            switch result {
            case .success:
                self.logger.log(type: .info, name: "successfullyResettedPassword")
                completionHandler(.success)
                return
            case .failure(let httpServiceError):
                let resetPasswordError = ResetPasswordError(error: httpServiceError)
                completionHandler(.failure(resetPasswordError))
                return
            }
        }
    }
    
    func refreshToken(completionHandler: @escaping (String?) -> Void) {
        if let loggedInUser = storage.user {
            let loginModel = LoginDTO(email: loggedInUser.email, password: loggedInUser.password)
            service.post(response: UserDTO.self, endpointUrl: self.loginEndpoint.getUrlString(with: environment), body: loginModel) { result in
                switch result {
                case .success(let userDto):
                    let updatedUser = User(from: userDto, with: loginModel.password)
                    self.storage.user = updatedUser
                    completionHandler(updatedUser.token)
                    return
                case .failure:
                    completionHandler(nil)
                    return
                }
            }
        } else {
            completionHandler(nil)
            return
        }
    }
}
