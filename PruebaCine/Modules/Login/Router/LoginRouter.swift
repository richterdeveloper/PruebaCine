//
//  LoginRouter.swift
//  PruebaCine
//
//  Created by mespinal on 31/05/22.
//

import Foundation
import UIKit

class LoginRouter {
    
    private weak var loginViewProtocol: LoginViewProtocol!
    
    init(withView view: LoginViewProtocol) {
        self.loginViewProtocol = view
    }
}

extension LoginRouter: LoginRouterProtocol {
    
    func goToMovies(originViewController: LoginViewController) {
        
        let storyboard = UIStoryboard(name: "Movies", bundle: nil)
        let destinyViewController = storyboard.instantiateViewController(withIdentifier: "MoviesViewController") as! MoviesViewController
        let navController = UINavigationController(rootViewController: destinyViewController)
        navController.modalPresentationStyle = .fullScreen
        
        originViewController.present(navController, animated: true, completion: nil)
    }
}
