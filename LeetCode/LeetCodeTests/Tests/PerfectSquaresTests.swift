//
//  PerfectSquaresTests.swift
//  CodingChallengesTests
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
        
        let number = PerfectSquares.numSquares(n)
        
        XCTAssertEqual(number, 3)
    }
    
    func test_B() {
        let n = 13
        
        let number = PerfectSquares.numSquares(n)
        
        XCTAssertEqual(number, 2)
    }
    
    func test_C() {
        let n = 7168
        
        let number = PerfectSquares.numSquares(n)
        
        XCTAssertEqual(number, 4)
    }
}
