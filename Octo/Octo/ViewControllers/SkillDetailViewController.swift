//
//  SkillDetailViewController.swift
//  Octo
//
//  Created by Will Saults on 3/30/19.
//  Copyright © 2019 Will Saults. All rights reserved.
//

import UIKit

class SkillDetailViewController: UIViewController {
    
    private var dataSource = QuestionsDataSource()

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            let question = Question(text: "How many bits are used to store an Int?")
            dataSource.questions.append(question)
            
            let answers = ["16-bit", "32-bit", "64-bit", "It depends on the device"]
            for answer in answers {
                dataSource.answers.append(Answer(text: answer))
            }
            
            tableView.dataSource = dataSource
        }
    }
    
    @IBOutlet weak var numberOfQuestionsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateNumberOfQuestionsLabel()
    }
    
    func updateNumberOfQuestionsLabel() {
        numberOfQuestionsLabel.text = "1 of \(dataSource.questions.count) Questions"
    }
}
