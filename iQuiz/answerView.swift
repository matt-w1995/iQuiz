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
        var correctAnswerValue = ""
        switch appdata.questionIndex {
        case 0:
            question.text = appdata.quizzes[topicIndex].questionOne
            correctAnswerValue = appdata.quizzes[topicIndex].questionOneCorrect
            correctAnswer.text = "The correct answer is " + correctAnswerValue
        default:
            question.text = appdata.quizzes[topicIndex].questionTwo
            correctAnswerValue = appdata.quizzes[topicIndex].questionTwoCorrect
            correctAnswer.text = "The correct answer is " + correctAnswerValue
        }
        if (appdata.userResponse == correctAnswerValue) {
            appdata.userScore += 1
        }
    }
    
    @IBAction func proceedBtn(_ sender: Any) {
        switch appdata.questionIndex {
        case 0:
            appdata.questionIndex = 1
            performSegue(withIdentifier: "nextQuestion", sender: self)
        default:
            appdata.questionIndex = 0
            performSegue(withIdentifier: "toResults", sender: self)
        }
    }
}
