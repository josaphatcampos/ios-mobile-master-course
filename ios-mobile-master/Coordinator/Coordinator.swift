//
//  Coordinator.swift
//  ios-mobile-master
//
//  Created by Josaphat Campos Pereira on 28/02/24.
//

import Foundation
import UIKit

protocol Coordinator{
    var navigationController:UINavigationController{get}
    func start()
    init(navigationController:UINavigationController)
}
