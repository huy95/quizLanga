//
//  QuestionViewController.swift
//  quizApp
//
//  Created by Huy on 7/13/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    var questionk: [Question]?
    var displayedIndex : Int = 0
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello"
        label.textColor = .red
        label.font = .systemFont(ofSize: 24)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    let answerTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemIndigo
        tableView.register(quizCell.self, forCellReuseIdentifier: "tableCell")
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        setupLabel()
        setupLayout()
        setupTable()
        addAction()
    //    Do any additional setup after loading the view.
    }
    // khi view chuẩn bị xuất hiện sẽ setup các thuộc tính của navigationBar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //setup cho navigationBar trong suot
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
    }
    func setupLabel() {
        questionLabel.text = questionk?[displayedIndex].question
    }
    func setupLayout(){
        view.addSubview(questionLabel)
        view.addSubview(answerTableView)
        //        view.addSubview(resultButton)
        questionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        questionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 16).isActive = true
        
        answerTableView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 32).isActive = true
        answerTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        answerTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        answerTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }
    func setupTable(){
        answerTableView.delegate = self
        answerTableView.dataSource = self
    }
    func addAction() {
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(nextQuestion))
        rightSwipe.direction = .left
        view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(previousQuestion))
        leftSwipe.direction = .right
        view.addGestureRecognizer(leftSwipe)
        
        //       resultButton.addTarget(self, action: #selector(navigateToResultScene), for: .touchUpInside)
    }
    
    @objc func nextQuestion() {
        if displayedIndex < questionk!.count - 1 {
            displayedIndex += 1
            answerTableView.reloadData()
            setupLabel()
            
        }
        //       displayResultButton()
    }
    
    @objc func previousQuestion() {
        if displayedIndex > 0 {
            displayedIndex -= 1
            answerTableView.reloadData()
            setupLabel()
        }
        //       displayResultButton()
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension QuestionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("table Ques")
        return questionk![displayedIndex].answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! quizCell
        //        cell.answerLabel.text = questionk?[displayedIndex].answers[indexPath.row].answer
        //        cell.state = questionk![displayedIndex].answers[indexPath.row].isSelected
        // do du lieu cuc
        cell.data = questionk![displayedIndex].answers[indexPath.row]
        // Bước 3: gọi closure ở đây - hung closure
        cell.passAction = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.questionk![self!.displayedIndex].answers[indexPath.row].isClosure.toggle()
            strongSelf.answerTableView.reloadData()
            
        }
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let state = questionk![displayedIndex].answers[indexPath.row].isSelected
        print("chon")
        print(state)
        
        if (self.displayedIndex < self.questionk!.count - 1) {
            print(self.displayedIndex)
            DispatchQueue.main.async {
        self.questionk![self.displayedIndex].answers[indexPath.row].isSelected = !state
                self.answerTableView.reloadData()
            }
            if self.displayedIndex <= self.questionk!.count - 2 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                self.displayedIndex += 1
                self.answerTableView.reloadData()
                self.setupLabel()
            }
            }}
        else {
            let questionVC = ViewEnd()
            print("chon 1")
            questionVC.questions = questionk
            navigationController?.pushViewController(questionVC, animated: true)
        }
        
        
    }
}
