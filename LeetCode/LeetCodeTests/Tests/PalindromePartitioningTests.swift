//
//  PalindromePartitioningTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 02/07/2023.
//

import XCTest

@testable import LeetCode

final class PalindromePartitioningTests: XCTestCase {

    //MARK: - Tests
    
    func test_A() {
        let s = "aab"
        
        let result = PalindromePartitioning().partition(s)
        
        XCTAssertEqual(result, [["a", "a", "b"],["aa", "b"]])
    }
    
    func test_B() {
        let s = "a"
        
        let result = PalindromePartitioning().partition(s)
        
        XCTAssertEqual(result, [["a"]])
    }
}
