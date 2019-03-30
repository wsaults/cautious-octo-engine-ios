//
//  CategoryTests.swift
//  OctoTests
//
//  Created by Will Saults on 3/30/19.
//  Copyright © 2019 Will Saults. All rights reserved.
//

import XCTest
@testable import Octo

class CategoryTests: XCTestCase {

    func testCategoryHasAName() {
        let category = Category(name: "Drawing")
        XCTAssertEqual(category.name, "Drawing")
    }
}
