//
//  LoginProtocol.swift
//  PruebaCine
//
//  Created by mespinal on 31/05/22.
//

import Foundation

protocol LoginConfiguratorProtocol {
    
    func configure(viewController: LoginViewController)
}

protocol LoginViewProtocol: AnyObject {
    
    func showBasicAlert(title:String?, message: String?)
}

protocol LoginPresenterProtocol {
    
    func goToValidateUser(userName: String, userPassword: String)
}

protocol LoginInteractorProtocol {
    
    func getUserValidation(userLoginInfo: UserRequest) -> Bool
}

protocol LoginRouterProtocol {
    
    func goToMovies(originViewController: LoginViewController)
}
