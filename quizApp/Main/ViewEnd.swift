//
//  ViewEnd.swift
//  quizApp
//
//  Created by Huy on 7/15/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class ViewEnd: UIViewController {
    var questions: [Question]?
    
    let resultLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = "Kết quả"
      label.textColor = .white
      label.font = .boldSystemFont(ofSize: 32)
      label.textAlignment = .center
      return label
    }()
    
    let countLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.text = ""
      label.textColor = .white
      label.font = .systemFont(ofSize: 32)
      label.textAlignment = .center
      return label
    }()
    
    let replayButton: UIButton = {
      let button = UIButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      button.setTitle("Chơi lại", for: .normal)
      button.setTitleColor(.white, for: .normal)
      button.backgroundColor = .systemPink
      button.layer.cornerRadius = 8
      return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        setupView()
        setupLayout()
        getResult()
        setupNavigation()
        setupAction()
        // Do any additional setup after loading the view.
    }
    
    func setupView() {
      view.addSubview(resultLabel)
      view.addSubview(countLabel)
      view.addSubview(replayButton)
    }
    
    func setupLayout() {
      resultLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
      resultLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
      resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
      resultLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 32).isActive = true
      
      countLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 32).isActive = true
      countLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
      countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
      countLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 32).isActive = true
      
      replayButton.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.maxY * 4 / 5).isActive = true
      replayButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
      replayButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
      replayButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupNavigation() {
      navigationItem.leftBarButtonItem = nil
      navigationItem.hidesBackButton = true
    }
    
    func setupAction() {
      replayButton.addTarget(self, action: #selector(navigateToRoot), for: .touchUpInside)
    }
    
    func getResult() {
      let rightAnswers = questions?.filter { (question) -> Bool in
        let userAnswers = question.answers.filter { (answer) -> Bool in
          return answer.isSelected
        }
        if userAnswers.count == 1 && question.answers[question.rightAnswers].isSelected {
          return true
        }
        else {
          return false
        }
      }
      
      let totalQuestions = questions!.count
      countLabel.text = "\(rightAnswers!.count) / \(totalQuestions)"
    }

    @objc func navigateToRoot() {
      navigationController?.popToRootViewController(animated: true)
    }
}
