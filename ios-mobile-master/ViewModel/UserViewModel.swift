//
//  UserViewModel.swift
//  ios-mobile-master
//
//  Created by Josaphat Campos Pereira on 29/02/24.
//

import Foundation

class UserViewModel{
    private let model:UserModel
    
    init(model: UserModel) {
        self.model = model
    }
    
    init(){
        self.model = UserModel()
    }
    
    var email:String {
        model.email
    }
    
    func getUserFromApi(_ email:String, _ password:String, completion: @escaping(Result<UserViewModel, Error>)->Void){
        let manager = UserManager(business: UserBusiness())
        
        manager.login(email: email, password: password) { userModel in
            completion(.success(UserViewModel(model: userModel)))
        } failureHandler: {  error in
            completion(.failure(error))
        }
    }
    
    func setUserFromApi(_ email:String, _ password:String, completion: @escaping(Result<UserViewModel, Error>)->Void){
        let manager = UserManager(business: UserBusiness())
        
        manager.register(email: email, password: password) { userModel in
            completion(.success(UserViewModel(model: userModel)))
        } failureHandler: {  error in
            completion(.failure(error))
        }
    }
}
