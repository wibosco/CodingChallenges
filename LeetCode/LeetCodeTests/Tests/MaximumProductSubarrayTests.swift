//
//  MaximumProductSubarrayTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 24/04/2023.
//

import XCTest

@testable import LeetCode

final class MaximumProductSubarrayTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [2, 3, -2, 4]
        
        let result = MaximumProductSubarray().maxProduct(nums)
        
        XCTAssertEqual(result, 6)
    }
    
    func test_B() {
        let nums = [-2, 0, -1]
        
        let result = MaximumProductSubarray().maxProduct(nums)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_C() {
        let nums = [-3, -1, -1]
        
        let result = MaximumProductSubarray().maxProduct(nums)
        
        XCTAssertEqual(result, 3)
    }
}
