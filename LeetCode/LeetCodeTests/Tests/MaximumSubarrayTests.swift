//
//  MaximumSubarrayTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 31/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class MaximumSubarrayTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
        
        let result = MaximumSubarray().maxSubArray(nums)
        
        XCTAssertEqual(result, 6)
    }
    
    func test_B() {
        let nums = [1]
        
        let result = MaximumSubarray().maxSubArray(nums)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let nums = [5, 4, -1, 7, 8]
        
        let result = MaximumSubarray().maxSubArray(nums)
        
        XCTAssertEqual(result, 23)
    }
}
