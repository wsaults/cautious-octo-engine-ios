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
    
    func testNumberOfQuestionsLabelShowsCount() {
        XCTAssertEqual(skillDetailViewController.numberOfQuestionsLabel.text, "1 of 1 Questions", "Number of questions label should match")
    }
    
    func testNumberOfQuestionsLabelShows1Of10Questions() {
        dataSource.questions = []
        
        for i in 0..<10 {
            let question = Question(text: "Q\(i)?")
            dataSource.questions.append(question)
        }
        
        skillDetailViewController.updateNumberOfQuestionsLabel()
        
        XCTAssertEqual(skillDetailViewController.numberOfQuestionsLabel.text, "1 of 10 Questions", "Number of questions label should match")
    }
    
    func testTappingAnAnswerShowsContinueButton() {
        XCTAssertTrue(skillDetailViewController.continueButton.isHidden, "Continue button should not be hidden")
        
        delegate.tableView?(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(!skillDetailViewController.continueButton.isHidden, "Continue button should be visible")
        XCTAssertEqual(skillDetailViewController.continueButton.titleLabel?.text, "Continue", "Continue button text should match")
    }
    
    func testTappingAnAnswerDisabledTheTable() {
        XCTAssertTrue(tableView.isUserInteractionEnabled, "User should be able to interact with the table")
        
        delegate.tableView?(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(!tableView.isUserInteractionEnabled, "User should not be able to interact with the table")
    }
}
