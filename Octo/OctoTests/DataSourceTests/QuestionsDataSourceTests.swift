//
//  QuestionsDataSourceTests.swift
//  OctoTests
//
//  Created by Will Saults on 3/31/19.
//  Copyright © 2019 Will Saults. All rights reserved.
//

import XCTest
@testable import Octo

class QuestionsDataSourceTests: XCTestCase {
    var dataSource: QuestionsDataSource!
    let tableView = UITableView()

    override func setUp() {
        super.setUp()
        dataSource = QuestionsDataSource()
        
        let question = Question(text: "What is the airspeed velocity of an unladen swallow?")
        dataSource.questions.append(question)
        
        let answer = Answer(text: "About 24 miles per hour")
        dataSource.answers.append(answer)
    }
    
    func testDataSourceHasQuestions() {
        XCTAssertEqual(dataSource.questions.count, 1, "DataSource should have 1 question")
    }
    
    func testNumberOfRows() {
        let numberOfRows = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 1, "Number of rows should match number of Answers")
    }
    
    func testCellForRow() {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.estimatedRowHeight = 44
        
        let cell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(cell.textLabel?.text, "About 24 miles per hour", "First cell text should be 'About 24 miles per hour'")
    }
    
    func testHasZeroSectionsWhenThereAreNoAnswers() {
        dataSource.answers = []
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 0, "TableView should have zero sections")
    }
    
    func testHasOneSectionsWhenAnswersArePresent() {
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "TableView should have one section when at least one Answer is present")
    }
    
    func testTableViewHasATitleLabel() {
        let titleForHeader = dataSource.tableView(tableView, titleForHeaderInSection: 0)
        XCTAssertEqual(titleForHeader, "What is the airspeed velocity of an unladen swallow?", "TableView title label should match")
    }
    
    func testTableTitleLabelIsEmptyWhenThereAreNoQuestions() {
        dataSource.questions = []
        let titleForHeader = dataSource.tableView(tableView, titleForHeaderInSection: 0)
        XCTAssertEqual(titleForHeader, "", "TableView title label should be empty")
    }
}
