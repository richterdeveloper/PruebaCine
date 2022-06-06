//
//  LoginPresenter.swift
//  PruebaCine
//
//  Created by mespinal on 31/05/22.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    
    weak var loginView: LoginViewProtocol!
    var interactor: LoginInteractorProtocol?
    var router: LoginRouterProtocol?
    
    init(view: LoginViewProtocol) {
        self.loginView = view
        self.interactor = LoginInteractor()
        self.router = LoginRouter(withView: self.loginView)
    }
    
    func goToValidateUser(userName: String, userPassword: String) {
        
        let isValidUser = self.interactor?.getUserValidation(userLoginInfo: UserRequest(userName: userName, userPassword: userPassword)) ?? false
        
        if isValidUser {
            
            self.router?.goToMovies(originViewController: loginView as! LoginViewController)
        } else {
            
            loginView.showBasicAlert(title: "Error", message: "El usuario y/o la contraseña son incorrectos.")
        }
    }
}
