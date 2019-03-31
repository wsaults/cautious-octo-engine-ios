//
//  SubCategoryViewControllerTests.swift
//  OctoTests
//
//  Created by Will Saults on 3/30/19.
//  Copyright © 2019 Will Saults. All rights reserved.
//

import XCTest
@testable import Octo

class SkillsViewControllerTests: XCTestCase {
    
    var skillsViewController: SkillsViewController!
    var dataSource: SkillsDataSource!
    var tableView: UITableView!
    var delegate: UITableViewDelegate!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let skillsViewController = storyboard.instantiateViewController(withIdentifier: "SkillsViewController") as? SkillsViewController else {
            return XCTFail("Could not instantiate SkillsViewController")
        }
        
        self.skillsViewController = skillsViewController
        self.skillsViewController.loadViewIfNeeded()
        tableView = self.skillsViewController.tableView
        
        guard let dataSource = tableView.dataSource as? SkillsDataSource else {
            return XCTFail("TableView should have a SkillsDataSource")
        }
        
        self.dataSource = dataSource
        delegate = tableView.delegate
    }
    
    func testTableOfSkillsViewControllerIsSetup() {
        XCTAssertNotNil(skillsViewController.tableView, "SkillsViewController should have a tableView")
        XCTAssertTrue(delegate === skillsViewController, "Delegate should be SkillsViewController")
        XCTAssertNotNil(skillsViewController.tableView.dataSource is SkillsDataSource, "SkillsViewController should have a datasource")
    }
    
    func testTableViewHasCells() {
        let cell = skillsViewController.tableView.dequeueReusableCell(withIdentifier: "Cell")
        XCTAssertNotNil(cell, "TableView has a cell with id: 'Cell'")
    }
    
    func testCellHasDisclosureIndicator() {
        let cell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.accessoryType, .disclosureIndicator, "Cell should have disclosure indicator")
    }
    
    func testCanTapTableCell() {
        let cell = skillsViewController.tableView.dataSource?.tableView(skillsViewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        skillsViewController.performSegue(withIdentifier: "ShowSkillDetail", sender: cell)
        
        XCTAssertNotNil(skillsViewController.presentedViewController is SkillDetailViewController)
    }
}
