//
//  QuizDTO.swift
//  iQuiz
//
//  Created by Matthew Wong on 11/5/18.
//  Copyright © 2018 Matthew Wong. All rights reserved.
//
import UIKit

class AppData: NSObject {
    static let shared = AppData()
    
    public struct Quiz: Codable {
        var title: String
        var desc: String
        var questions: [Question]
    }
    
    public struct Question: Codable {
        var text: String
        var answer: String
        var answers: [String]
    }
    
    open var quizzes = [Quiz]()
    open var url = "http://tednewardsandbox.site44.com/questions.json"
    open var topicIndex = 0
    open var questionIndex = 0
    open var userResponse = ""
    open var userScore = 0
}
