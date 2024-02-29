//
//  LoginViewController.swift
//  ios-mobile-master
//
//  Created by Josaphat Campos Pereira on 28/02/24.
//

import Foundation
import UIKit

class LoginViewController:UIViewController{
    //MARK - Properties
    lazy var loginView: LoginView = {
        let view = LoginView(frame: .zero)
        view.onLoginTap = {[weak self] email, password in
            self?.loginTap(email, password)
        }
        view.onRegisterTap = {[weak self] in
            self?.onRegisterTap?()
        }
        return view
    }()
    
    //MARK - Closures
    var onRegisterTap:(()->Void)?
    var onLoginSuccess:(()->Void)?
    
    //MARK: Overrides
    override func loadView(){
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Login"
    }
    
    //MARK - Functions
    private func loginTap(_ email:String, _ password:String){
        let userViewModel = UserViewModel()
        userViewModel.getUserFromApi(email, password) { [weak self] result in
            switch result {
            case .success(_):
                self?.onLoginSuccess?()
            case .failure(let failure):
                self?.showMessage("Error", failure.localizedDescription)
            }
        }
    }
    
    func showMessage(_ title:String, _ message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }

}
