//
//  modul.swift
//  quizApp
//
//  Created by Huy on 7/12/20.
//  Copyright © 2020 Huy. All rights reserved.
//

import Foundation
struct Test {
    let subject: String 
    var questions: [Question]
}
struct Question {
    let question: String
    let rightAnswers: Int
    var answers: [Answer]
}
struct Answer {
    let  answer: String
    var isSelected: Bool
    var isClosure: Bool
}

