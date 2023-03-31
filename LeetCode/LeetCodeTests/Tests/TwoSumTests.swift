//
//  TwoSumTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 03/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class TwoSumTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [2, 7, 11, 15]
        let target = 9
        
        let indices = TwoSum.twoSum(nums, target)
        
        XCTAssertEqual([0, 1], indices)
    }
    
    func test_B() {
        let nums = [3, 2, 4]
        let target = 6
        
        let indices = TwoSum.twoSum(nums, target)
        
        XCTAssertEqual([1, 2], indices)
    }
    
    func test_C() {
        let nums = [3, 3]
        let target = 6
        
        let indices = TwoSum.twoSum(nums, target)
        
        XCTAssertEqual([0, 1], indices)
    }
}
