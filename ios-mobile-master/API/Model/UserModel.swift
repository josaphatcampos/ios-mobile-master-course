//
//  UserModel.swift
//  ios-mobile-master
//
//  Created by Josaphat Campos Pereira on 26/02/24.
//

import Foundation

struct UserModel: Codable{
    let email: String
    let password:String
    
    init(){
        self.email = String()
        self.password = String()
    }
    
    init(email:String, password:String) {
        self.email = email
        self.password = password
    }
}
