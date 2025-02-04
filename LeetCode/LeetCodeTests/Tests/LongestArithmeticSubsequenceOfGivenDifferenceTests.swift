//
//  LongestArithmeticSubsequenceOfGivenDifferenceTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 14/07/2023.
//

import XCTest

@testable import LeetCode

final class LongestArithmeticSubsequenceOfGivenDifferenceTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let arr = [1, 2, 3, 4]
        let difference = 1
        
        let result = LongestArithmeticSubsequenceOfGivenDifference().longestSubsequence(arr, difference)
        
        XCTAssertEqual(result, 4)
    }
    
    func test_B() {
        let arr = [1, 3, 5, 7]
        let difference = 1
        
        let result = LongestArithmeticSubsequenceOfGivenDifference().longestSubsequence(arr, difference)
        
        XCTAssertEqual(result, 1)
    }
    
    func test_C() {
        let arr = [1, 5, 7, 8, 5, 3, 4, 2, 1]
        let difference = -2
        
        let result = LongestArithmeticSubsequenceOfGivenDifference().longestSubsequence(arr, difference)
        
        XCTAssertEqual(result, 4)
    }
}
