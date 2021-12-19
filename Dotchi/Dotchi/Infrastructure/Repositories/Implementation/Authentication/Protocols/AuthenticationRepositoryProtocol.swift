//
//  AuthenticationRepositoryProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 14/06/2021.
//

import Foundation

protocol AuthenticationRepositoryProtocol {
    typealias LoginResultCallback = (Result<User, LoginError>) -> Void
    typealias CreateAccountResultCallback = (Result<Void, CreateAccountError>) -> Void
    typealias ResetPasswordResultCallback = (Result<Void, ResetPasswordError>) -> Void
    typealias RefreshedTokenCallback = (String?) -> Void
    
    func login(with loginModel: LoginDTO, completionHandler: @escaping LoginResultCallback)
    func createAccount(with createAccountModel: CreateAccountDTO, completionHandler: @escaping CreateAccountResultCallback)
    func resetPassword(with resetPasswordModel: ResetPasswordDTO, completionHandler: @escaping ResetPasswordResultCallback)
    func refreshToken(completionHandler: @escaping RefreshedTokenCallback)
}
