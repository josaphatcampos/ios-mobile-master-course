//
//  HomeView.swift
//  ios-mobile-master
//
//  Created by Josaphat Campos Pereira on 29/02/24.
//

import Foundation
import UIKit

class HomeView: UIView{
    
    lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Swift Arch MVVM with Coordinator"
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        
        return label
    }()
    
    //MARK: - Override
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .viewBackground
        setVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Visual Elements
    func setVisualElements(){
        self.addSubview(helloLabel)
        
        NSLayoutConstraint.activate([
            helloLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            helloLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
