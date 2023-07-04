//
//  ContinuousSubarraySumTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 02/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class ContinuousSubarraySumTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [23, 2, 4, 6, 7]
        let k = 6
        
        let result = ContinuousSubarraySum.checkSubarraySum(nums, k)
        
        XCTAssertTrue(result)
    }
    
    func test_B() {
        let nums = [23, 2, 6, 4, 7]
        let k = 13
        
        let result = ContinuousSubarraySum.checkSubarraySum(nums, k)
        
        XCTAssertFalse(result)
    }
    
    func test_C() {
        let nums = [1, 0]
        let k = 2
        
        let result = ContinuousSubarraySum.checkSubarraySum(nums, k)
        
        XCTAssertFalse(result)
    }
    
    func test_D() {
        let nums = [1, 2, 3]
        let k = 5
        
        let result = ContinuousSubarraySum.checkSubarraySum(nums, k)
        
        XCTAssertTrue(result)
    }
    
    func test_E() {
        let nums = [1, 2, 12]
        let k = 6
        
        let result = ContinuousSubarraySum.checkSubarraySum(nums, k)
        
        XCTAssertFalse(result)
    }
    
    func test_F() {
        let nums = [5, 0, 0, 0]
        let k = 3
        
        let result = ContinuousSubarraySum.checkSubarraySum(nums, k)
        
        XCTAssertTrue(result)
    }
}
