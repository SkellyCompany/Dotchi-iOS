import Foundation
import SwiftyCommunicationServices

extension AuthenticationRepository: AuthenticationRepositoryProtocol {
    func login(with loginModel: LoginDTO, completionHandler: @escaping LoginResultCallback) {
        service.post(response: UserDTO.self,
                     endpointUrl: Endpoint.login.getUrlString(with: environment),
                     body: loginModel) { result in
            switch result {
            case .success(let userDto):
                let user = User(from: userDto, with: loginModel.password)
                self.storage.user = user
                self.logger.log(type: .info, name: "successLogin")
                completionHandler(.success(user))
                return
            case .failure(let httpServiceError):
                let loginError = LoginError(error: httpServiceError)
                self.logger.log(type: .info, name: "failureLogin")
                completionHandler(.failure(loginError))
                return
            }
        }
    }

    func createAccount(with createAccountModel: CreateAccountDTO,
                       completionHandler: @escaping CreateAccountResultCallback) {
        service.post(endpointUrl: Endpoint.createAccount.getUrlString(with: environment),
                     body: createAccountModel) { result in
            switch result {
            case .success:
                self.logger.log(type: .info, name: "successCreateAccount")
                completionHandler(.success(()))
                return
            case .failure(let httpServiceError):
                let createAccountError = CreateAccountError(error: httpServiceError)
                self.logger.log(type: .info, name: "failureCreateAccount")
                completionHandler(.failure(createAccountError))
                return
            }
        }
    }

    func resetPassword(with resetPasswordModel: ResetPasswordDTO,
                       completionHandler: @escaping ResetPasswordResultCallback) {
        service.post(endpointUrl: Endpoint.resetPassword.getUrlString(with: environment),
                     body: resetPasswordModel) { result in
            switch result {
            case .success:
                self.logger.log(type: .info, name: "successResetPassword")
                completionHandler(.success(()))
                return
            case .failure(let httpServiceError):
                let resetPasswordError = ResetPasswordError(error: httpServiceError)
                self.logger.log(type: .info, name: "failureResetPassword")
                completionHandler(.failure(resetPasswordError))
                return
            }
        }
    }

    func refreshToken(completionHandler: @escaping (String?) -> Void) {
        if let loggedInUser = storage.user {
            let loginModel = LoginDTO(email: loggedInUser.email, password: loggedInUser.password)
            service.post(response: UserDTO.self,
                         endpointUrl: Endpoint.login.getUrlString(with: environment),
                         body: loginModel) { result in
                switch result {
                case .success(let userDto):
                    let updatedUser = User(from: userDto, with: loginModel.password)
                    self.storage.user = updatedUser
                    self.logger.log(type: .info, name: "successRefreshToken")
                    completionHandler(updatedUser.token)
                    return
                case .failure:
                    self.logger.log(type: .info, name: "failureRefreshToken")
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
