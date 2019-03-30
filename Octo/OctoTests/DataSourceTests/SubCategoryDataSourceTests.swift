//
//  SubCategoryDataSource.swift
//  OctoTests
//
//  Created by Will Saults on 3/30/19.
//  Copyright © 2019 Will Saults. All rights reserved.
//

import XCTest
@testable import Octo

class SubCategoryDataSourceTests: XCTestCase {
    var dataSource: SubCategoryDataSource!
    let tableView = UITableView()

    override func setUp() {
        super.setUp()
        dataSource = SubCategoryDataSource()
        
        let subCategory = SubCategory(name: "TypeScript")
        dataSource.subCategories.append(subCategory)
    }
    
    func testDataSourceHasSubCategories() {
        XCTAssertEqual(dataSource.subCategories.count, 1, "DataSource should have 1 subCategory")
    }
    
    func testNumberOfRows() {
        let numberOfRows = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 1, "Number of rows should match number of subCategories")
    }
    
    func testCellForRow() {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.estimatedRowHeight = 44
        
        let cell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.textLabel?.text, "TypeScript", "First cell text should be TypeScript")
    }
    
    func testHasZeroSectionsWhenThereAreNoSubCategories() {
        dataSource.subCategories = []
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 0, "TableView should have zero sections")
    }
    
    func testHasOneSectionsWhenSubCategoriesArePresent() {
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "TableView should have one section when at least one subCategory is present")
    }
}
