//
//  NumberOfSubarraysWithBoundedMaximumTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 12/09/2024.
//

import XCTest

@testable import LeetCode

final class NumberOfSubarraysWithBoundedMaximumTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [2,1,4,3]
        let left = 2
        let right = 3
            
        let result = NumberOfSubarraysWithBoundedMaximum().numSubarrayBoundedMax(nums, left, right)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_B() {
        let nums = [2,9,2,5,6]
        let left = 2
        let right = 8
            
        let result = NumberOfSubarraysWithBoundedMaximum().numSubarrayBoundedMax(nums, left, right)
        
        XCTAssertEqual(result, 7)
    }
    
    func test_C() {
        let nums = [3,2,1]
        let left = 3
        let right = 5
            
        let result = NumberOfSubarraysWithBoundedMaximum().numSubarrayBoundedMax(nums, left, right)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_D() {
        let nums = [3,2,1,4]
        let left = 3
        let right = 5
            
        let result = NumberOfSubarraysWithBoundedMaximum().numSubarrayBoundedMax(nums, left, right)
        
        XCTAssertEqual(result, 7)
    }
    
    func test_E() {
        let nums = [3,2,1,4,1]
        let left = 3
        let right = 5
            
        let result = NumberOfSubarraysWithBoundedMaximum().numSubarrayBoundedMax(nums, left, right)
        
        XCTAssertEqual(result, 11)
    }
}
