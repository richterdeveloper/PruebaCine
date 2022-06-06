//
//  LoginViewController.swift
//  PruebaCine
//
//  Created by mespinal on 31/05/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var presenter: LoginPresenterProtocol?
    var configurator: LoginConfiguratorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configurator = LoginConfigurator()
        configurator?.configure(viewController: self)
    }
    
    func setUp() {
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleViewTap)))
        view.isUserInteractionEnabled = true
    }
    

    @IBAction func tapLoginButton(_ sender: Any) {
        
        presenter?.goToValidateUser(userName: userTextField.text ?? "", userPassword: passwordTextField.text ?? "")
    }
    
    @objc func handleViewTap() {
        
        view.endEditing(true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        view.endEditing(true)
        
        return false
    }
}

extension LoginViewController: LoginViewProtocol {
    
    func showBasicAlert(title: String?, message: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
