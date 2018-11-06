//
//  resultsView.swift
//  iQuiz
//
//  Created by Matthew Wong on 11/5/18.
//  Copyright © 2018 Matthew Wong. All rights reserved.
//

import UIKit

class resultsView: UIViewController {
    
    var appdata = AppData.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        renderScoreLabel()
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    func renderScoreLabel() {
        scoreLabel.text = "You got " + String(appdata.userScore) + " out of 2!"
    }
}

