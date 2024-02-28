//
//  RegisterPresenter.swift
//  ios-mobile-master
//
//  Created by Josaphat Campos Pereira on 28/02/24.
//

import Foundation

protocol RegisterPresenterDelegate{
    func showMessage(title: String, message: String)
    func goHome()
}

class RegisterPresenter{
    var delegate: RegisterPresenterDelegate?
    
    func register(userModel:UserModel){
        let manager = UserManager(business: UserBusiness())
        manager.register(email: userModel.email, password: userModel.password) { [weak self] userModel in
            self?.delegate?.goHome()
        } failureHandler: { [weak self] error in
            self?.delegate?.showMessage(title: "Error", message: error.localizedDescription)
        }

    }
}
