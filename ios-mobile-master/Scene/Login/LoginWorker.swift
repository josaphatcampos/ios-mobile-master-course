//
//  LoginWorker.swift
//  ios-mobile-master
//
//  Created by Josaphat Campos Pereira on 29/02/24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class LoginWorker
{
    func doSomeWork()
    {
    }
    
    func loginUser(userModel:UserModel, successHandler: @escaping((UserModel?)->Void), failHandler: @escaping((Error?)->Void))
    {
        let manager = UserManager(business: UserBusiness())
        
        manager.login(email: userModel.email, password: userModel.password) { userModel in
            successHandler(userModel)
        } failureHandler: { error in
            failHandler(error)
        }
        
    }
}
