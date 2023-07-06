//
//  MinimumSizeSubarraySumTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 06/07/2023.
//

import XCTest

@testable import LeetCode

final class MinimumSizeSubarraySumTests: XCTestCase {
    
    //MARK: - Tests
    
    func test_A() {
        let target = 7
        let nums = [2, 3, 1, 2, 4, 3]
        
        let result = MinimumSizeSubarraySum.minSubArrayLen(target, nums)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let target = 4
        let nums = [1, 4, 4]
        
        let result = MinimumSizeSubarraySum.minSubArrayLen(target, nums)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let target = 11
        let nums = [1, 1, 1, 1, 1, 1, 1, 1]
        
        let result = MinimumSizeSubarraySum.minSubArrayLen(target, nums)
        
        XCTAssertEqual(result, 0)
    }
}
