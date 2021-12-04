//
//  AuthenticationRepositoryProtocol.swift
//  Portal
//
//  Created by Greg Charyszczak on 14/06/2021.
//

import Foundation

protocol AuthenticationRepositoryProtocol {
    typealias LoginResultCallback = (DataResult<User, LoginError>) -> Void
    typealias CreateAccountResultCallback = (DataResult<EmptyOutput, CreateAccountError>) -> Void
    typealias ResetPasswordResultCallback = (DataResult<EmptyOutput, ResetPasswordError>) -> Void
    typealias RefreshedTokenCallback = (String?) -> Void
    
    func login(with loginModel: LoginDTO, completionHandler: @escaping LoginResultCallback)
    func createAccount(with createAccountModel: CreateAccountDTO, completionHandler: @escaping CreateAccountResultCallback)
    func resetPassword(with resetPasswordModel: ResetPasswordDTO, completionHandler: @escaping ResetPasswordResultCallback)
    func refreshToken(completionHandler: @escaping RefreshedTokenCallback)
}
