//
//  ViewController.swift
//  iQuiz
//
//  Created by Matthew Wong on 10/29/18.
//  Copyright © 2018 Matthew Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var quizzes = [Quiz]()
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuizes()
        table.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func loadQuizes() {
        let memeIcon = UIImage(named: "Bad_Luck_Brian")
        let memeQuiz = Quiz(title: "Meme Quiz", description: "Yeet on in to test your knowledge of the today's spicest memes. ", icon: memeIcon!)
        
        let mathIcon = UIImage(named: "math_img")
        let mathQuiz = Quiz(title: "Math Quiz", description: "Test your knowlege on this quiz that tests your math skills.", icon: mathIcon!)
        
        let theOfficeIcon = UIImage(named: "the_office")
        let officeQuiz = Quiz(title: "The Office Quiz", description: "How well do you know The Office? Test your skills here!", icon: theOfficeIcon!)
        
        quizzes += [memeQuiz, mathQuiz, officeQuiz]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "quizCell"
        let quizCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! iQuizTableViewCell
        
        let quiz = quizzes[indexPath.row]
        
        quizCell.iQuizTitle?.text = quiz.title
        quizCell.iQuizDescription?.text = quiz.description
        quizCell.iQuizImage?.image = quiz.icon
        
        return quizCell
    }

    @IBAction func settingsOnClick(_ sender: Any) {
        let alert = UIAlertController(title: "Settings", message: "Check back for settings!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

struct Quiz {
    var title: String
    var description: String
    var icon: UIImage
}

