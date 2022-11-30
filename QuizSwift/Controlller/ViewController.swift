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
    
    // cannot use "let" because it will make the whole struct inmmutable
    var quiz : Quiz = Quiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.titleLabel!.text!
        let isCorrect = quiz.checkAnswer(userAnswer)
        
        sender.backgroundColor = isCorrect ? UIColor.green : UIColor.red
        quiz.nextQuestion()
                
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quiz.getQuestionText()
        progressBar.progress = quiz.getProgress()
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

