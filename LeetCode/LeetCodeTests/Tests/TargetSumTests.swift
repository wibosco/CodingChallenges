//
//  TargetSumTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 15/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class TargetSumTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let nums = [1, 1, 1, 1, 1]
        let target = 3
        
        let paths = TargetSum.findTargetSumWays(nums, target)
        
        XCTAssertEqual(paths, 5)
    }
    
    func test_B() {
        let nums = [1]
        let target = 1
        
        let paths = TargetSum.findTargetSumWays(nums, target)
        
        XCTAssertEqual(paths, 1)
    }
}
