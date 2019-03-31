//
//  SkillsDataSourceTests.swift
//  OctoTests
//
//  Created by Will Saults on 3/30/19.
//  Copyright © 2019 Will Saults. All rights reserved.
//

import XCTest
@testable import Octo

class SkillsDataSourceTests: XCTestCase {
    var dataSource: SkillsDataSource!
    let tableView = UITableView()

    override func setUp() {
        super.setUp()
        dataSource = SkillsDataSource()
        
        let skill = Skill(name: "iOS")
        dataSource.skills.append(skill)
    }
    
    func testDataSourceHasSkills() {
        XCTAssertEqual(dataSource.skills.count, 1, "DataSource should have 1 skill")
    }
    
    func testNumberOfRows() {
        let numberOfRows = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 1, "Number of rows should match number of Skills")
    }
    
    func testCellForRow() {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.estimatedRowHeight = 44
        
        let cell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.textLabel?.text, "iOS", "First cell text should be iOS")
    }
    
    func testHasZeroSectionsWhenThereAreNoSkills() {
        dataSource.skills = []
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 0, "TableView should have zero sections")
    }
    
    func testHasOneSectionsWhenSkillsArePresent() {
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "TableView should have one section when at least one Skill is present")
    }
}
