//
//  HomeViewController.swift
//  ios-mobile-master
//
//  Created by Josaphat Campos Pereira on 29/02/24.
//

import Foundation
import UIKit

class HomeViewController:UIViewController{
    
    lazy var homeView:UIView = {
        let view = HomeView(frame: .zero)
        
        return view
    }()
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
    }
    
    
}
