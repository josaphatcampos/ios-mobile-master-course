//
//  LoginView.swift
//  ios-mobile-master
//
//  Created by Josaphat Campos Pereira on 29/02/24.
//

import Foundation
import UIKit

class LoginView: UIView{
    //MARK: - Closures
    var onLoginTap:((_ userModel:UserModel)->Void)?
    var onRegisterTap:(()->Void)?
    
    //MARK: - Properties
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "E-mail"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        
        return label
    }()
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Password"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var passWordTextField:UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.systemMint.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = .white
        textField.textColor = .darkGray
        textField.setLeftPaddingPoints(15)
        
        textField.placeholder = "Put your password"
        textField.keyboardType = .default
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        
        return textField
    }()
    
    lazy var emailTextField:UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.systemMint.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = .white
        textField.textColor = .darkGray
        textField.setLeftPaddingPoints(15)
        
        textField.placeholder = "Put your e-mail"
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        
        return textField
    }()
    
    lazy var loginButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(loginButtonAct), for: .touchUpInside)
        
        return button
    }()
    
    lazy var registerButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(registerButtonAct), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Constraints
    private func setupVisualElements(){
        setupEmail()
        setupPassword()
        setupButtons()
    }
    
    private func setupEmail(){
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            emailLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setupPassword(){
        self.addSubview(passwordLabel)
        self.addSubview(passWordTextField)
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo:  emailTextField.bottomAnchor, constant: 32),
            passwordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            passwordLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            
            passWordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passWordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            passWordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            passWordTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setupButtons(){
        self.addSubview(loginButton)
        self.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo:  passWordTextField.bottomAnchor, constant: 32),
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            registerButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    
    
    //MARK: - Functions
    
    
    //MARK: - Actions
    @objc
    func loginButtonAct(){
        if let email = emailTextField.text, let password = passWordTextField.text{
            self.onLoginTap?(UserModel(email: email, password: password))
        }
       
    }
    
    @objc
    func registerButtonAct(){
        self.onRegisterTap?()
    }
}
