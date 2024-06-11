//
//  CountBinarySubstringsTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 11/06/2024.
//

import XCTest

@testable import LeetCode

final class CountBinarySubstringsTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_A() {
        let s = "00110011"
        
        let result = CountBinarySubstrings().countBinarySubstrings(s)
        
        XCTAssertEqual(result, 6)
    }
        
    func test_B() {
        let s = "10101"
        
        let result = CountBinarySubstrings().countBinarySubstrings(s)
        
        XCTAssertEqual(result, 4)
    }
}
