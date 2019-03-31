//
//  AnswerTests.swift
//  OctoTests
//
//  Created by Will Saults on 3/31/19.
//  Copyright © 2019 Will Saults. All rights reserved.
//

import XCTest
@testable import Octo

class AnswerTests: XCTestCase {

    func testAnswerHasText() {
        let answer = Answer(text: "Blue")
        XCTAssertEqual(answer.text, "Blue")
    }
}
