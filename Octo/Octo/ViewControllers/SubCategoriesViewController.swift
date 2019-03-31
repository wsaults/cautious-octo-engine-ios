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
            let names = ["Gaming", "Hardware", "IT", "Programming", "Software", "Tech Repairs"]
            for name in names {
                dataSource.subCategories.append(SubCategory(name: name))
            }
            tableView.dataSource = dataSource
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
