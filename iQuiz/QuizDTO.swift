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
    
    struct Quiz {
        var title: String
        var description: String
        var icon: UIImage
        var questionOne: String
        var questionOneOptions: [String]
        var questionOneCorrect: String
        var questionTwo: String
        var questionTwoOptions: [String]
        var questionTwoCorrect: String
    }
    
    open var quizzes: [Quiz] = [
                                Quiz(title: "Meme Quiz", description: "Yeet on in to test your knowledge of the today's spicest memes.", icon: UIImage(named: "Bad_Luck_Brian")!,
                                     questionOne: "Who was back at it again with the white vans?",
                                     questionOneOptions: ["Daniel", "Jefferey", "Donald", "Charlie"],
                                     questionOneCorrect: "Daniel",
                                     questionTwo: "What does the kid like?",
                                     questionTwoOptions: ["Frogs", "Birds", "Turtles", "Sharks"],
                                     questionTwoCorrect: "Turtles"
        ),
                                Quiz(title: "The Office Quiz", description: "How well do you know The Office? Test your skills here!", icon: UIImage(named: "the_office")!,
                                     questionOne: "Where is Deangelo Vicker's personal heaven",
                                     questionOneOptions: ["Dunking from the free throw line", "Controlling the inner circle", "The American Southwest", "Duner Mifflin"],
                                     questionOneCorrect: "The American Southwest",
                                     questionTwo: "Break me off a piece of that _____?",
                                     questionTwoOptions: ["Apple Sauce", "Crylser Car", "Football Cream", "Kit-kat Bar"],
                                     questionTwoCorrect: "Football Cream"
        ),
                                Quiz(title: "Math Quiz", description: "Test your knowlege on this quiz that tests your math skills.", icon: UIImage(named: "math_img")!,
                                     questionOne: "1 + 1 = ?",
                                     questionOneOptions: ["1", "2", "3", "4"],
                                     questionOneCorrect: "2",
                                     questionTwo: "2 * 2 = ?",
                                     questionTwoOptions: ["1", "2", "3", "4"],
                                     questionTwoCorrect: "4"
        )
    ]
    
    open var topicIndex = 0
    open var questionIndex = 0
    open var userResponse = ""
    open var userScore = 0
}
