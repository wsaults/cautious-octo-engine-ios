//
//  SubCategoriesViewControllerTests.swift
//  OctoTests
//
//  Created by Will Saults on 3/30/19.
//  Copyright © 2019 Will Saults. All rights reserved.
//

import XCTest
@testable import Octo

class SubCategoriesViewControllerTests: XCTestCase {
    
    var subCategoriesController: SubCategoriesViewController!
    var dataSource: SubCategoryDataSource!
    var tableView: UITableView!
    var delegate: UITableViewDelegate!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let subCategoriesController = storyboard.instantiateViewController(withIdentifier: "SubCategoriesViewController") as? SubCategoriesViewController else {
            return XCTFail("Could not instantiate SubCategoriesViewController")
        }
        
        self.subCategoriesController = subCategoriesController
        self.subCategoriesController.loadViewIfNeeded()
        tableView = self.subCategoriesController.tableView
        
        guard let dataSource = tableView.dataSource as? SubCategoryDataSource else {
            return XCTFail("TableView should have a SubCategoryDataSource")
        }
        
        self.dataSource = dataSource
        delegate = tableView.delegate
    }
    
    func testTableOfSubCategoriesIsSetup() {
        XCTAssertNotNil(subCategoriesController.tableView, "SubCategoriesViewController should hava a tableView")
        XCTAssertTrue(delegate === subCategoriesController, "Delegate should be SubCategoriesViewController")
        XCTAssertNotNil(subCategoriesController.tableView.dataSource is SubCategoryDataSource, "SubCategoriesViewController should have a datasource")
    }
    
    func testTableViewHasCells() {
        let cell = subCategoriesController.tableView.dequeueReusableCell(withIdentifier: "Cell")
        XCTAssertNotNil(cell, "TableView has a cell with id: 'Cell'")
    }
    
    func testCellHasDisclosureIndicator() {
        let cell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.accessoryType, .disclosureIndicator, "Cell should have disclosure indicator")
    }
    
    func testCanTapTableCell() {
        let cell = subCategoriesController.tableView.dataSource?.tableView(subCategoriesController.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        subCategoriesController.performSegue(withIdentifier: "ShowSkillsList", sender: cell)
        
        XCTAssertNotNil(subCategoriesController.presentedViewController is SkillsViewController)
    }
}
