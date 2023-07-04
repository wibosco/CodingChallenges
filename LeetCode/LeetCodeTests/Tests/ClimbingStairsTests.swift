//
//  ClimbingStairsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 21/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class ClimbingStairsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let n = 2
        
        let result = ClimbingStairs.climbStairs(n)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let n = 3
        
        let result = ClimbingStairs.climbStairs(n)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_C() {
        let n = 35
        
        let result = ClimbingStairs.climbStairs(n)
        
        XCTAssertEqual(result, 14930352)
    }
}
