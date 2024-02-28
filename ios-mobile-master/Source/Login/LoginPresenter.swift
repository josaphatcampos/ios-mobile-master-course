//
//  LoginPresenter.swift
//  ios-mobile-master
//
//  Created by Josaphat Campos Pereira on 28/02/24.
//

import Foundation

protocol LoginPresenterDelegate{
    func showMessage(title: String, message: String)
    func goHome()
}

class LoginPresenter{
    var delegate: LoginPresenterDelegate?
    
    func login(userModel: UserModel){
        print("Chamou")
        let manager = UserManager(business: UserBusiness())
            manager.login(email: userModel.email, password: userModel.password) {[weak self] usermodel in
                self?.delegate?.goHome()
        } failureHandler: { [weak self] error in
            print("nao logou")
            self?.delegate?.showMessage(title: "Error", message: error.localizedDescription)
        }
    }
}
