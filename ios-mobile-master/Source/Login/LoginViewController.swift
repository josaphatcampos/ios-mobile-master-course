//
//  LoginViewController.swift
//  ios-mobile-master
//
//  Created by Josaphat Campos Pereira on 27/02/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    let presenter:LoginPresenter = LoginPresenter()
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            let userModel:UserModel = UserModel(email: email, password: password)
            presenter.login(userModel: userModel)
        }
    }
    
    @IBAction func registerButton(_ sender: Any) {
        let registerView = self.storyboard?.instantiateViewController(withIdentifier:"registerViewController") as! RegisterViewController
        registerView.modalPresentationStyle = .fullScreen
        self.present(registerView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.delegate = self
    }
}

extension LoginViewController: LoginPresenterDelegate{
    func goHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let homeView = storyboard.instantiateViewController(withIdentifier: "homeViewController") as! HomeViewController
        
        homeView.modalPresentationStyle = .fullScreen
        self.present(homeView, animated: true)
    }
    
    func showMessage(title: String, message: String){
        let alert:UIAlertController = UIAlertController(title:title, message:message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true)
    }
}
