//
//  ViewController.swift
//  Octo
//
//  Created by Will Saults on 3/30/19.
//  Copyright © 2019 Will Saults. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    private var dataSource = CategoryDataSource()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            let names = ["Academics", "The Arts", "Auto", "Business", "Lifestyle", "Health & Wellness", "Language", "Outdoors", "Remedail", "Sporta & Games", "Technology", "Trades"]
            for name in names {
                let category = Category(name: name)
                dataSource.categories.append(category)
            }
            
            tableView.dataSource = dataSource
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
