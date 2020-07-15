//
//  ViewController.swift
//  quizApp
//
//  Created by Huy on 7/12/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var datas : [Test] = []
    let quizNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "multiple choice"
        label.textColor = UIColor.brown
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    let topicCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        // dagn ki
        collectionView.register(topCollectionView.self, forCellWithReuseIdentifier: "cell1")
        return collectionView
    }()
    override func viewDidLoad() {
        datas = fakeData()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setupLayout()
        setupCollectionView()
    }
    func setupLayout(){
        view.addSubview(quizNameLabel)
        view.addSubview(topicCollectionView)
        quizNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        quizNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        quizNameLabel.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: 1).isActive = true
        quizNameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 32).isActive = true
        
        topicCollectionView.topAnchor.constraint(equalTo: quizNameLabel.bottomAnchor, constant: 32).isActive = true
        topicCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        topicCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        topicCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    func setupCollectionView(){
        topicCollectionView.dataSource = self
        topicCollectionView.delegate = self
    }
    
    
}
extension ViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! topCollectionView
        cell.topicLabel.text = datas[indexPath.row].subject
 
        return cell
    }
    // function trả về khoảng cách giữa 2 hàng
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    // kich co cua cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let radius = UIScreen.main.bounds.maxX
        return CGSize(width: radius / 2 - 24, height: radius / 2 - 24)
    }
    // hàm trả về khoảng cách giữa 2 item (tương tự 2 cột)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let questionVC = QuestionViewController()
        
//        let navigation = UINavigationController(rootViewController: questionVC)
//        navigation.modalPresentationStyle = .fullScreen
//        present(navigation, animated: true, completion: nil)
        
        //        navigationItem.backBarButtonItem?.tintColor = .red
        print("chon")
        questionVC.questionk = datas[indexPath.row].questions
        
        
        navigationController?.pushViewController(questionVC, animated: true)
        navigationItem.backBarButtonItem?.tintColor = .white
    }
    
}
