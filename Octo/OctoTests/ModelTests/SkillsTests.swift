//
//  SkillsTests.swift
//  OctoTests
//
//  Created by Will Saults on 3/30/19.
//  Copyright © 2019 Will Saults. All rights reserved.
//

import XCTest
@testable import Octo

class SkillsTests: XCTestCase {
    
    func testCategoryHasAName() {
        let category = Skill(name: "iOS")
        XCTAssertEqual(category.name, "iOS")
    }
}
