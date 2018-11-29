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
        let question = quiz.questions[appdata.questionIndex]
        questionText.text = question.text
        answerOne.setTitle(question.answers[0], for: [])
        answerTwo.setTitle(question.answers[1], for: [])
        answerThree.setTitle(question.answers[2], for: [])
        answerFour.setTitle(question.answers[3], for: [])
    }
    
    
    @IBAction func btnActionHandler(_ sender: UIButton) {
        sender.backgroundColor = UIColor.lightGray
        appdata.userResponse = sender.titleLabel?.text as! String
        performSegue(withIdentifier: "toAnswers", sender: self)
    }
}
