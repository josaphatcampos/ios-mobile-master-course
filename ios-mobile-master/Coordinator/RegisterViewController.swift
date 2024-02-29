//
//  RegisterViewController.swift
//  ios-mobile-master
//
//  Created by Josaphat Campos Pereira on 29/02/24.
//

import Foundation
import UIKit

class RegisterViewController:UIViewController{
    
    //MARK - Properties
    lazy var registerView: RegisterView = {
        let view = RegisterView(frame: .zero)
                
        view.onRegisterTap = {[weak self] email, password in
            self?.registerTap(email,password)
        }
        return view
    }()
    
    
    //MARK - Closures
    var onRegisterSuccess:(()->Void)?
    
    //MARK - Overrides
    override func loadView() {
        self.view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Register"
    }
    
    //MARK - Functions
    private func registerTap(_ email:String, _ password:String){
        let userViewModel = UserViewModel()
        
        userViewModel.setUserFromApi(email, password) { [weak self] result in
            switch result {
            case .success(_):
                self?.onRegisterSuccess?()
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
