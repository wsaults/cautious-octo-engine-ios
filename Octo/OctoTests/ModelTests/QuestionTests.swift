//
//  QuestionTests.swift
//  OctoTests
//
//  Created by Will Saults on 3/31/19.
//  Copyright © 2019 Will Saults. All rights reserved.
//

import XCTest
@testable import Octo

class QuestionTests: XCTestCase {

    func testQuestionHasText() {
        let question = Question(text: "What color is the sky?")
        XCTAssertEqual(question.text, "What color is the sky?")
    }
}
