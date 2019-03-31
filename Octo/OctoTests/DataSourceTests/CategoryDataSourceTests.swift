//
//  CategoryDataSourceTests.swift
//  OctoTests
//
//  Created by Will Saults on 3/30/19.
//  Copyright © 2019 Will Saults. All rights reserved.
//

import XCTest
@testable import Octo

class CategoryDataSourceTests: XCTestCase {
    var dataSource: CategoryDataSource!
    let tableView = UITableView()
    
    override func setUp() {
        super.setUp()
        dataSource = CategoryDataSource()
        
        let category = Category(name: "Technology")
        dataSource.categories.append(category)
    }

    func testDataSourceHasCategories() {
        XCTAssertEqual(dataSource.categories.count, 1, "DataSource should have 1 category")
    }
    
    func testNumberOfRows() {
        let numberOfRows = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 1, "Number of rows should match number of categories")
    }
    
    func testCellForRow() {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.estimatedRowHeight = 44
        
        let cell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.textLabel?.text, "Technology", "First cell text should be Technology")
    }
    
    func testHasZeroSectionsWhenThereAreNoCategories() {
        dataSource.categories = []
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 0, "TableView should have zero sections")
    }
    
    func testHasOneSectionsWhenCategoriesArePresent() {
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "TableView should have one section when at least one category is present")
    }
}
