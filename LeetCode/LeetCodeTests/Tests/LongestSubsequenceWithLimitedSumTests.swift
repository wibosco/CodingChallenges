//
//  LongestSubsequenceWithLimitedSumTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 25/02/2024.
//

import XCTest

@testable import LeetCode

final class LongestSubsequenceWithLimitedSumTests: XCTestCase {
    
    //MARK: - Tests
    
    func test_A() {
        let nums = [4,5,2,1]
        let queries = [3,10,21]
        
        let result = LongestSubsequenceWithLimitedSum().answerQueries(nums, queries)
        
        XCTAssertEqual(result, [2,3,4])
    }
    
    func test_B() {
        let nums = [2,3,4,5]
        let queries = [1]
        
        let result = LongestSubsequenceWithLimitedSum().answerQueries(nums, queries)
        
        XCTAssertEqual(result, [0])
    }
}
