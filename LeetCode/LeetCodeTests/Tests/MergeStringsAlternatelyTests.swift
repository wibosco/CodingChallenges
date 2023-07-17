//
//  MergeStringsAlternatelyTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 17/07/2023.
//

import XCTest

@testable import LeetCode

final class MergeStringsAlternatelyTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let word1 = "abc"
        let word2 = "pqr"
        
        let result = MergeStringsAlternately.mergeAlternately(word1, word2)
        
        XCTAssertEqual(result, "apbqcr")
    }
    
    func test_B() {
        let word1 = "ab"
        let word2 = "pqr"
        
        let result = MergeStringsAlternately.mergeAlternately(word1, word2)
        
        XCTAssertEqual(result, "apbqr")
    }
    
    func test_C() {
        let word1 = "abcd"
        let word2 = "pq"
        
        let result = MergeStringsAlternately.mergeAlternately(word1, word2)
        
        XCTAssertEqual(result, "apbqcd")
    }
}
