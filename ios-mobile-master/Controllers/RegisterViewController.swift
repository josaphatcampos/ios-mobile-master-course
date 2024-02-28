//
//  RegisterViewController.swift
//  ios-mobile-master
//
//  Created by Josaphat Campos Pereira on 28/02/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBAction func registerButton(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text, let confirmpass = confirmPasswordTextField.text {
            
            if password != confirmpass {
                showMessage(title: "Error", message: "Confirm Password not matched")
                return
            }
            
            let manager = UserManager(business: UserBusiness())
            
            manager.register(email: email, password: password) { userModel in
                
                let homeView = self.storyboard?.instantiateViewController(withIdentifier: "homeViewController") as! HomeViewController
                homeView.modalPresentationStyle = .fullScreen
                self.present(homeView, animated: true)
                
            } failureHandler: { error in
                self.showMessage(title: "Error", message: error.localizedDescription)
            }

        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func showMessage(title:String, message:String){
        let alert:UIAlertController = UIAlertController(title:title, message:message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
