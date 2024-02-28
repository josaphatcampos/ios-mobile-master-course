//
//  LoginViewController.swift
//  ios-mobile-master
//
//  Created by Josaphat Campos Pereira on 27/02/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
        let manager = UserManager(business: UserBusiness())
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            manager.login(email: email, password: password) { userModel in
                
                let homeView = self.storyboard?.instantiateViewController(withIdentifier: "homeViewController") as! HomeViewController
                homeView.modalPresentationStyle = .fullScreen
                self.present(homeView, animated: true)
                
            } failureHandler: { error in
                self.showMessage(title: "Error", message: error.localizedDescription)
            }
        }
        
        
        
    }
    
    @IBAction func registerButton(_ sender: Any) {
        
        let registerView = self.storyboard?.instantiateViewController(withIdentifier:"registerViewController") as! RegisterViewController
        registerView.modalPresentationStyle = .fullScreen
        self.present(registerView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showMessage(title:String, message:String){
        let alert:UIAlertController = UIAlertController(title:title, message:message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true)
    }

}
