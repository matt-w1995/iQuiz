//
//  iQuizTableViewCell.swift
//  iQuiz
//
//  Created by Matthew Wong on 10/29/18.
//  Copyright © 2018 Matthew Wong. All rights reserved.
//

import UIKit

class iQuizTableViewCell: UITableViewCell {
    @IBOutlet weak var iQuizTitle: UILabel!
    @IBOutlet weak var iQuizDescription: UILabel!
    @IBOutlet weak var iQuizImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
