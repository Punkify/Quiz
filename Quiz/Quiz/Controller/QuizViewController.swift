//
//  ViewController.swift
//  Quiz
//
//  Created by Developer on 25/11/21.
//

import UIKit

class QuizViewController: UIViewController {
     
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
       let userAnswer = sender.currentTitle
       
       let userResponse = quizBrain.checkAnswer(userAnswer!)
        
        if userResponse == true {
            sender.backgroundColor = .green
        } else {
            print("wrong")
            sender.backgroundColor = .red
        }

        quizBrain.nextQuestion()
      
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
   @objc func updateUI(){
        
       questionLabel.text = quizBrain.questionText()
       trueButton.backgroundColor = UIColor.clear
       falseButton.backgroundColor = UIColor.clear
       progressBar.progress = quizBrain.questionProgress()
       scoreLabel.text = "Your Score: \(quizBrain.score)"
        
    }
    
}

