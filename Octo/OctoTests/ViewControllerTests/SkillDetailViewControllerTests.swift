//
//  SkillDetailViewControllerTests.swift
//  OctoTests
//
//  Created by Will Saults on 3/30/19.
//  Copyright © 2019 Will Saults. All rights reserved.
//

import XCTest
@testable import Octo

class SkillDetailViewControllerTests: XCTestCase {
    
    var skillDetailViewController: SkillDetailViewController!
    var dataSource: QuestionsDataSource!
    var tableView: UITableView!
    var delegate: UITableViewDelegate!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let skillDetailViewController = storyboard.instantiateViewController(withIdentifier: "SkillDetailViewController") as? SkillDetailViewController else {
            return XCTFail("Could not instantiate SkillDetailViewController")
        }
        
        self.skillDetailViewController = skillDetailViewController
        self.skillDetailViewController.loadViewIfNeeded()
        tableView = self.skillDetailViewController.tableView
        
        guard let dataSource = tableView.dataSource as? QuestionsDataSource else {
            return XCTFail("TableView should have a QuestionsDataSource")
        }
        
        self.dataSource = dataSource
        delegate = tableView.delegate
    }
    
    func testTableOfskillDetailViewControllerIsSetup() {
        XCTAssertNotNil(skillDetailViewController.tableView, "SkillDetailViewController should have a tableView")
        XCTAssertTrue(delegate === skillDetailViewController, "Delegate should be SkillDetailViewController")
        XCTAssertNotNil(skillDetailViewController.tableView.dataSource is QuestionsDataSource, "SkillDetailViewController should have a datasource")
    }
    
    func testTableViewHasCells() {
        let cell = skillDetailViewController.tableView.dequeueReusableCell(withIdentifier: "Cell")
        XCTAssertNotNil(cell, "TableView has a cell with id: 'Cell'")
    }
}
