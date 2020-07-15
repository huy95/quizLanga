//
//  topCollectionView.swift
//  quizApp
//
//  Created by Huy on 7/13/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class topCollectionView: UICollectionViewCell {
    
    let topicLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .systemIndigo
        label.textAlignment = .center
        //        label.backgroundColor = .green
        label.font = .systemFont(ofSize: 32)
        return label
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
        
        setupView()
        setupLayout()

        self.layer.cornerRadius = 16
    }
    func setupView() {
        self.addSubview(topicLabel)
    }
    
    func setupLayout() {
        
        topicLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        topicLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        topicLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        topicLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
