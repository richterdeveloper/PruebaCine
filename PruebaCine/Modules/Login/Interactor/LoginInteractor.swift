//
//  LoginInteractor.swift
//  PruebaCine
//
//  Created by mespinal on 31/05/22.
//

import Foundation

class LoginInteractor: LoginInteractorProtocol {
    
    func getUserValidation(userLoginInfo: UserRequest) -> Bool {
        
        let userData = UserData()
        
        if userLoginInfo.userName != userData.email {
            
            return false
        }
        
        if userLoginInfo.userPassword != userData.passwrd {
            
            return false
        }
        
        return true
    }
}
