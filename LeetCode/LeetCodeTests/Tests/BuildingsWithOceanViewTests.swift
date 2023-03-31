//
//  BuildingsWithOceanViewTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 12/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class BuildingsWithOceanViewTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let heights = [4, 2, 3, 1]
        
        let oceanViews = BuildingsWithOceanView.findBuildings(heights)
        
        XCTAssertEqual(oceanViews, [0, 2, 3]) // indexes
    }
    
    func test_B() {
        let heights = [4, 3, 2, 1]
        
        let oceanViews = BuildingsWithOceanView.findBuildings(heights)
        
        XCTAssertEqual(oceanViews, [0, 1, 2, 3]) // indexes
    }
    
    func test_C() {
        let heights = [1, 3, 2, 4]
        
        let oceanViews = BuildingsWithOceanView.findBuildings(heights)
        
        XCTAssertEqual(oceanViews, [3]) // indexes
    }
}
