//
//  ViewController.swift
//  QuizSwift
//
//  Created by kenneth.ng@lifehikes.com on 29/11/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let questions : [Question] = [
        Question(text: "1 + 3 = 4", answer: "True"),
        Question(text: "4 + 5 = 0", answer: "False"),
        Question(text: "8 x 9 = 74", answer: "False")
    ]
    var currentQuestion : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.titleLabel!.text!
        if questions[currentQuestion].answer == userAnswer {
            print("Correct!")
            
            if currentQuestion + 1 < questions.count {
                currentQuestion += 1
            } else {
                currentQuestion = 0
            }
            
            updateUI()
        } else {
            print("Wrong!")
        }
    }
    
    func updateUI() {
        questionLabel.text = questions[currentQuestion].text
    }
    
}

