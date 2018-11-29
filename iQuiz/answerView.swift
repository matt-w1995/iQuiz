//
//  answerView.swift
//  iQuiz
//
//  Created by Matthew Wong on 11/5/18.
//  Copyright © 2018 Matthew Wong. All rights reserved.
//

import UIKit

class answerView: UIViewController {
    
    var appdata = AppData.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAnswerView()
    }
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var userAnswer: UILabel!
    @IBOutlet weak var correctAnswer: UILabel!
    @IBOutlet weak var proceedButton: UIButton!
    
    
   func loadAnswerView() {
        userAnswer.text = "Your answer is " + appdata.userResponse
        let topicIndex = appdata.topicIndex
        let quiz = appdata.quizzes[topicIndex]
        let quizQuestion = quiz.questions[appdata.questionIndex]
        let correctAnswerText = quizQuestion.answers[Int(quizQuestion.answer)! - 1]
        question.text = quizQuestion.text
        correctAnswer.text = "The correct answer is " + correctAnswerText
        proceedButton.setTitle("Next", for: [])
        if (appdata.userResponse == correctAnswerText) {
            appdata.userScore += 1
        }
    }

    @IBAction func proceedBtn(_ sender: Any) {
        let topicIndex = appdata.topicIndex
        let quiz = appdata.quizzes[topicIndex]
        if (appdata.questionIndex >= quiz.questions.count - 1) {
            appdata.questionIndex = 0
            performSegue(withIdentifier: "toResults", sender: self)
        } else {
            appdata.questionIndex += 1
            performSegue(withIdentifier: "nextQuestion", sender: self)

        }
    }
}
