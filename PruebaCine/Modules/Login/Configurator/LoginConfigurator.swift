//
//  LoginConfigurator.swift
//  PruebaCine
//
//  Created by mespinal on 5/06/22.
//

import Foundation

class LoginConfigurator: LoginConfiguratorProtocol {
    
    func configure(viewController: LoginViewController) {
        
        viewController.presenter = LoginPresenter(view: viewController)
    }
}
