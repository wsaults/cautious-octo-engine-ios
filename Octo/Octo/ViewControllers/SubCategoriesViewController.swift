//
//  SubCategoriesViewController.swift
//  Octo
//
//  Created by Will Saults on 3/30/19.
//  Copyright © 2019 Will Saults. All rights reserved.
//

import UIKit

class SubCategoriesViewController: UIViewController {
    
    private var dataSource = SubCategoryDataSource()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            let names = ["TypeScript", "iOS", "Android", "Pivotal Cloud Foundry"]
            for name in names {
                let subCategory = SubCategory(name: name)
                dataSource.subCategories.append(subCategory)
            }
            tableView.dataSource = dataSource
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
