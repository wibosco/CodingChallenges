//
//  ContinuousSubarraySumTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 02/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

class ContinuousSubarraySumTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [23, 2, 4, 6, 7]
        let k = 6
        
        let contains = ContinuousSubarraySum.checkSubarraySum(nums, k)
        
        XCTAssertTrue(contains)
    }
    
    func test_B() {
        let nums = [23, 2, 6, 4, 7]
        let k = 13
        
        let contains = ContinuousSubarraySum.checkSubarraySum(nums, k)
        
        XCTAssertFalse(contains)
    }
    
    func test_C() {
        let nums = [1, 0]
        let k = 2
        
        let contains = ContinuousSubarraySum.checkSubarraySum(nums, k)
        
        XCTAssertFalse(contains)
    }
    
    func test_D() {
        let nums = [1, 2, 3]
        let k = 5
        
        let contains = ContinuousSubarraySum.checkSubarraySum(nums, k)
        
        XCTAssertTrue(contains)
    }
    
    func test_E() {
        let nums = [1, 2, 12]
        let k = 6
        
        let contains = ContinuousSubarraySum.checkSubarraySum(nums, k)
        
        XCTAssertFalse(contains)
    }

}
