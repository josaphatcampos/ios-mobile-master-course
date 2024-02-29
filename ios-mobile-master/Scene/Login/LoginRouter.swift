//
//  LoginRouter.swift
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

@objc protocol LoginRoutingLogic
{
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    func routeToHome()
    func routerToRegister()
}

protocol LoginDataPassing
{
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing
{
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    // MARK: Routing
    
    func routeToHome() {
        let destinationViewController = HomeViewController()
        navigateToPush(source: viewController!, destination: destinationViewController)
    }
    
    func routerToRegister() {
        let destinationViewController = RegisterViewController()
        navigateToPush(source: viewController!, destination: destinationViewController)
    }
    
    // MARK: Navigation
    
    func navigateToPush(source: LoginViewController, destination: UIViewController)
    {
        destination.modalPresentationStyle = .fullScreen
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    // MARK: Passing data
    
    func passDataToModal(source: LoginDataStore, destination: inout UIViewController)
    {
//        destination.modalPresentationStyle = .fullScreen
//        source.showDetailViewController(destination, sender: dataStore)
    }
}
