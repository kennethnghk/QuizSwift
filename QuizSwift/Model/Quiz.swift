//
//  Quiz.swift
//  QuizSwift
//
//  Created by kenneth.ng@lifehikes.com on 30/11/2022.
//

import Foundation

struct Quiz {
    let questions : [Question] = [
        Question(text: "1 + 3 = 4", answer: "True"),
        Question(text: "4 + 5 = 0", answer: "False"),
        Question(text: "8 x 9 = 74", answer: "False"),
        Question(text: "8 x 1 = 8", answer: "True")
    ]
    
    var currentQuestion: Int = 0
    
    func checkAnswer(_ answer : String) -> Bool {
        if answer == questions[currentQuestion].answer {
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        return questions[currentQuestion].text
    }
    
    func getProgress() -> Float {
        return Float(currentQuestion + 1) / Float(questions.count)
    }
    
    // property (self) is not multable inside the struct
    mutating func nextQuestion() {
        if currentQuestion + 1 < questions.count {
            currentQuestion += 1
        } else {
            currentQuestion = 0
        }
    }
}
