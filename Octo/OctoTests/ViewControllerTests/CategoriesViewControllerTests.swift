//
//  CategoriesViewControllerTests.swift
//  OctoTests
//
//  Created by Will Saults on 3/30/19.
//  Copyright © 2019 Will Saults. All rights reserved.
//

import XCTest
@testable import Octo

class CategoriesViewControllerTests: XCTestCase {
    
    var categoriesController: CategoriesViewController!
    var dataSource: CategoryDataSource!
    var tableView: UITableView!
    var delegate: UITableViewDelegate!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController else {
            return XCTFail("Could not instantiate UINavigationController")
        }
        
        guard let categoriesController = navigationController.topViewController as? CategoriesViewController else {
            return XCTFail("Could not instantiate CategoriesViewController")
        }
        
        self.categoriesController = categoriesController
        self.categoriesController.loadViewIfNeeded()
        tableView = self.categoriesController.tableView
        
        guard let dataSource = tableView.dataSource as? CategoryDataSource else {
            return XCTFail("TableView should have a CategoryDataSource")
        }
        
        self.dataSource = dataSource
        delegate = tableView.delegate
    }
    
    func testTableOfCategoriesIsSetup() {
        XCTAssertNotNil(categoriesController.tableView, "categoriesController should have a tableView")
        XCTAssertTrue(delegate === categoriesController, "Delegate should be categoriesController")
        XCTAssertNotNil(categoriesController.tableView.dataSource is CategoryDataSource, "Subject should have a datasource")
    }
    
    func testTableViewHasCells() {
        let cell = categoriesController.tableView.dequeueReusableCell(withIdentifier: "Cell")
        XCTAssertNotNil(cell, "TableView has a cell with id: 'Cell'")
    }
    
    func testCellHasDisclosureIndicator() {
        let cell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.accessoryType, .disclosureIndicator, "Cell should have disclosure indicator")
    }
    
    func testCanTapTableCell() {
        let cell = categoriesController.tableView.dataSource?.tableView(categoriesController.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        categoriesController.performSegue(withIdentifier: "ShowSubCategories", sender: cell)
        
        XCTAssertNotNil(categoriesController.presentedViewController is SubCategoriesViewController)
    }
}
