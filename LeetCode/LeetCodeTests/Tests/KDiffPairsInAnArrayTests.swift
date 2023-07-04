//
//  KDiffPairsInAnArrayTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 10/02/2022.
//

import XCTest

@testable import LeetCode

final class KDiffPairsInAnArrayTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let nums = [3, 1, 4, 1, 5]
        let k = 2
        
        let result = KDiffPairsInAnArray.findPairs(nums, k)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let nums = [1, 2, 3, 4, 5]
        let k = 1
        
        let result = KDiffPairsInAnArray.findPairs(nums, k)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_C() {
        let nums = [1, 3, 1, 5, 4]
        let k = 0
        
        let result = KDiffPairsInAnArray.findPairs(nums, k)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_D() {
        let nums = [1, 2, 4, 4, 3, 3, 0, 9, 2, 3]
        let k = 3
        
        let result = KDiffPairsInAnArray.findPairs(nums, k)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_E() {
        let nums = [1, 1, 1, 1, 1]
        let k = 0
        
        let result = KDiffPairsInAnArray.findPairs(nums, k)
        
        XCTAssertEqual(result, 1)
    }
}
