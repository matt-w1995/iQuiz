//
//  ViewController.swift
//  iQuiz
//
//  Created by Matthew Wong on 10/29/18.
//  Copyright © 2018 Matthew Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    var quizzes = [Quiz]()
    @IBOutlet weak var table: UITableView!
    
    var quizData = AppData.shared
    var quizzes = AppData.shared.quizzes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        quizData.topicIndex = indexPath.row
        quizData.questionIndex = 0
        performSegue(withIdentifier: "toQuestions", sender: self)
    }
    
}
    


