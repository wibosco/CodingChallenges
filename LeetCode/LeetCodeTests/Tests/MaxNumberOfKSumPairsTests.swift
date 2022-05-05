//
//  MaxNumberOfKSumPairsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 05/05/2022.
//

import XCTest

@testable import LeetCode

class MaxNumberOfKSumPairsTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [1, 2, 3, 4]
        let k = 5
        
        let operationsCount = MaxNumberOfKSumPairs.maxOperations(nums, k)
        
        XCTAssertEqual(operationsCount, 2)
    }
    
    func test_B() {
        let nums = [3, 1, 3, 4, 3]
        let k = 6
        
        let operationsCount = MaxNumberOfKSumPairs.maxOperations(nums, k)
        
        XCTAssertEqual(operationsCount, 1)
    }
    
    func test_C() {
        let nums = [3, 1, 3, 4, 3]
        let k = 9
        
        let operationsCount = MaxNumberOfKSumPairs.maxOperations(nums, k)
        
        XCTAssertEqual(operationsCount, 0)
    }
}
