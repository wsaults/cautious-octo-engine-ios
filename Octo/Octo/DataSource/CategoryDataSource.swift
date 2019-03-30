//
//  CategoriesDataSource.swift
//  Octo
//
//  Created by Will Saults on 3/30/19.
//  Copyright © 2019 Will Saults. All rights reserved.
//

import UIKit

class CategoryDataSource: NSObject, UITableViewDataSource {
    var categories = [Category]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row].name
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count > 0 ? 1 : 0
    }
}
