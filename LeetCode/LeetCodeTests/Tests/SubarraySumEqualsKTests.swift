//
//  SubarraySumEqualsKTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 03/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class SubarraySumEqualsKTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [1, 1, 1]
        let k = 2
        
        let result = SubarraySumEqualsK().subarraySum(nums, k)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let nums = [1, 2, 3]
        let k = 3
        
        let result = SubarraySumEqualsK().subarraySum(nums, k)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_C() {
        let nums = [1, -1, 0]
        let k = 0
        
        let result = SubarraySumEqualsK().subarraySum(nums, k)
        
        XCTAssertEqual(result, 3)
    }
}
