//
//  questionView.swift
//  iQuiz
//
//  Created by Matthew Wong on 11/5/18.
//  Copyright © 2018 Matthew Wong. All rights reserved.
//
import UIKit

class QuestionViewController: UIViewController {
    
    var appdata = AppData.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadQAView()
    }
    
    @IBOutlet weak var questionText: UILabel!

    
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    @IBOutlet weak var answerFour: UIButton!
    
    
    weak var selectedBtn: UIButton!
    var selectedAnswer: String = ""
    
    func loadQAView() {
        let topicIndex = appdata.topicIndex
        let quiz = appdata.quizzes[topicIndex]
        switch appdata.questionIndex {
        case 0:
            questionText.text = quiz.questionOne
            answerOne.setTitle(quiz.questionOneOptions[0], for: [])
            answerTwo.setTitle(quiz.questionOneOptions[1], for: [])
            answerThree.setTitle(quiz.questionOneOptions[2], for: [])
            answerFour.setTitle(quiz.questionOneOptions[3], for: [])
            
        default:
            questionText.text = quiz.questionTwo
            answerOne.setTitle(quiz.questionTwoOptions[0], for: [])
            answerTwo.setTitle(quiz.questionTwoOptions[1], for: [])
            answerThree.setTitle(quiz.questionTwoOptions[2], for: [])
            answerFour.setTitle(quiz.questionTwoOptions[3], for: [])
        }
    }
    
    
    @IBAction func btnActionHandler(_ sender: UIButton) {
        sender.backgroundColor = UIColor.lightGray
        appdata.userResponse = sender.titleLabel?.text as! String
        performSegue(withIdentifier: "toAnswers", sender: self)
    }
}
