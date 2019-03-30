//
//  SubCategoryTests.swift
//  OctoTests
//
//  Created by Will Saults on 3/30/19.
//  Copyright © 2019 Will Saults. All rights reserved.
//

import XCTest
@testable import Octo

class SubCategoryTests: XCTestCase {
    
    func testCategoryHasAName() {
        let subCategory = SubCategory(name: "iOS")
        XCTAssertEqual(subCategory.name, "iOS")
    }
}

