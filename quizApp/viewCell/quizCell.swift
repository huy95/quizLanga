//
//  quizCell.swift
//  quizApp
//
//  Created by Huy on 7/13/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class quizCell: UITableViewCell {
    var state : Bool = false
    let mainView : UIView = {
        let mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    let answerLabel: UILabel = {
        let answerLabel = UILabel()
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.text = ""
        answerLabel.textColor = .blue
        answerLabel.font = .systemFont(ofSize: 20)
        answerLabel.numberOfLines = 0
        return answerLabel
    }()
    let answerImageView: UIImageView = {
        let answerImage = UIImageView()
        answerImage.translatesAutoresizingMaskIntoConstraints = false
        answerImage.image = UIImage(named: "check")
        return answerImage
    }()
    
    let answerImageclosure: UIImageView = {
        let answerImage = UIImageView()
        answerImage.translatesAutoresizingMaskIntoConstraints = false
        answerImage.image = UIImage(named: "check")
        return answerImage
    }()
    
    var data: Answer?{
        didSet{
            if let data = data {
                answerLabel.text = data.answer
                state = data.isSelected
                answerImageclosure.image = UIImage(named: data.isClosure ? "check" : "uncheck1")
            }
        }
    }
    
    // b1 : tao 1 closure
    var passAction: (() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupLayout()
        self.backgroundColor = .systemIndigo
        displayCheckBox()
        // Configure the view for the selected state
        
        
        answerImageclosure.isUserInteractionEnabled = true
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(changeSelect))
//        answerImageclosure.addGestureRecognizer(gesture)
        
        answerImageclosure.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeSelect)))
    }
    
    @objc func changeSelect(){
        print("closure")
        // buoc 2 
        passAction?()
    }
    func setupLayout(){
        self.addSubview(mainView)
        mainView.addSubview(answerLabel)
        mainView.addSubview(answerImageView)
        mainView.addSubview(answerImageclosure)
        answerImageView.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor, multiplier: 0.6).isActive = true
        answerImageView.widthAnchor.constraint(equalTo: answerImageView.heightAnchor, constant: 1).isActive = true
        answerImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        answerImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        
        answerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        answerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60).isActive = true
        answerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -100).isActive = true
        answerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
//        answerImageclosure.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
//        answerImageclosure.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100).isActive = true
//        answerImageclosure.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50).isActive = true
//        answerImageclosure.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        answerImageclosure.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor, multiplier: 0.6).isActive = true
        answerImageclosure.widthAnchor.constraint(equalTo: answerImageclosure.heightAnchor, constant: 1).isActive = true
        answerImageclosure.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        answerImageclosure.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
    func displayCheckBox() {
        if state {
               answerImageView.image = UIImage(named: "check")
           } else {
               answerImageView.image = UIImage(named: "uncheck1")
           }
       }
    
}
