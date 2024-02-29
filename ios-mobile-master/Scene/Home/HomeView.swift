//
//  HomeView.swift
//  ios-mobile-master
//
//  Created by Josaphat Campos Pereira on 29/02/24.
//

import Foundation
import UIKit

class HomeView:UIView{
    //MARK: - Closures
    
    //MARK: - Properties
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Swift Arch VIP (Clean Swift)"
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        
        return label
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
        setupWelcomeLabel()
    }
    
    private func setupWelcomeLabel(){
        self.addSubview(welcomeLabel)
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    //MARK: - Functions
    
    
    //MARK: - Actions
}
