//
//  PerfectSquaresTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 13/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class PerfectSquaresTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let n = 12
        
        let result = PerfectSquares.numSquares(n)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let n = 13
        
        let result = PerfectSquares.numSquares(n)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let n = 7168
        
        let result = PerfectSquares.numSquares(n)
        
        XCTAssertEqual(result, 4)
    }
}
