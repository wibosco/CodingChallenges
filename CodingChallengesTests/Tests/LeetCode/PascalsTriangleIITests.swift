//
//  PascalsTriangleIITests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 20/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import CodingChallenges

class PascalsTriangleIITests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let rowIndex = 3
        
        let level = PascalsTriangleII.getRow(rowIndex)
        
        XCTAssertEqual(level, [1, 3, 3, 1])
    }
    
    func test_B() {
        let rowIndex = 0
        
        let level = PascalsTriangleII.getRow(rowIndex)
        
        XCTAssertEqual(level, [1])
    }
    
    func test_C() {
        let rowIndex = 1
        
        let level = PascalsTriangleII.getRow(rowIndex)
        
        XCTAssertEqual(level, [1, 1])
    }

}
