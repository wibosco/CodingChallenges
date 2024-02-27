//
//  TwoSumLessThanKTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 27/02/2024.
//

import XCTest

@testable import LeetCode

final class TwoSumLessThanKTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let nums = [34,23,1,24,75,33,54,8]
        let k = 60
        
        let result = TwoSumLessThanK().twoSumLessThanK(nums, k)
        
        XCTAssertEqual(result, 58)
    }
    
    func test_B() {
        let nums = [10,20,30]
        let k = 15
        
        let result = TwoSumLessThanK().twoSumLessThanK(nums, k)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_C() {
        let nums = [10,20,30]
        let k = 30
        
        let result = TwoSumLessThanK().twoSumLessThanK(nums, k)
        
        XCTAssertEqual(result, -1)
    }
}
