//
//  QuestionsDataSource.swift
//  Octo
//
//  Created by Will Saults on 3/31/19.
//  Copyright © 2019 Will Saults. All rights reserved.
//

import UIKit

class QuestionsDataSource: NSObject, UITableViewDataSource {
    var questions = [Question]()
    var answers = [Answer]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = answers[indexPath.row].text
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return answers.count > 0 ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return questions.count > 0 ? questions[0].text : ""
    }
}
