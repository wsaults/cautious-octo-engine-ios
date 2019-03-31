//
//  SubCategoryViewController.swift
//  Octo
//
//  Created by Will Saults on 3/30/19.
//  Copyright © 2019 Will Saults. All rights reserved.
//

import UIKit

class SkillsViewController: UIViewController {
    
    private var dataSource = SkillsDataSource()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            let names = ["Swift", "TypeScript", "JavaScript", "Java", "Pivotal Cloud Foundry"]
            for name in names {
                let skill = Skill(name: name)
                dataSource.skills.append(skill)
            }
            
            tableView.dataSource = dataSource
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
