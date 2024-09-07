//
//  ShortestUnsortedContinuousSubarrayTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 07/09/2024.
//

import XCTest

@testable import LeetCode

final class ShortestUnsortedContinuousSubarrayTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [2,6,4,8,10,9,15]
        
        let result = ShortestUnsortedContinuousSubarray().findUnsortedSubarray(nums)
        
        XCTAssertEqual(result, 5)
    }
    
    func test_B() {
        let nums = [1,2,3,4]
        
        let result = ShortestUnsortedContinuousSubarray().findUnsortedSubarray(nums)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_C() {
        let nums = [1]
        
        let result = ShortestUnsortedContinuousSubarray().findUnsortedSubarray(nums)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_D() {
        let nums = [1,3,2,4,5]
        
        let result = ShortestUnsortedContinuousSubarray().findUnsortedSubarray(nums)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_E() {
        let nums = [1,2,3,3,3]
        
        let result = ShortestUnsortedContinuousSubarray().findUnsortedSubarray(nums)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_F() {
        let nums = [1,3,2,2,4,5]
        
        let result = ShortestUnsortedContinuousSubarray().findUnsortedSubarray(nums)
        
        XCTAssertEqual(result, 3)
    }
}
