//
//  LongestCommonPrefixTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 08/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class LongestCommonPrefixTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let strs = ["flower", "flow", "flight"]
        
        let result = LongestCommonPrefix().longestCommonPrefix(strs)
        
        XCTAssertEqual(result, "fl")
    }
    
    func test_B() {
        let strs = ["dog", "racecar", "car"]
        
        let result = LongestCommonPrefix().longestCommonPrefix(strs)
        
        XCTAssertEqual(result, "")
    }
    
    func test_C() {
        let strs = ["a"]
        
        let result = LongestCommonPrefix().longestCommonPrefix(strs)
        
        XCTAssertEqual(result, "a")
    }
    
    func test_D() {
        let strs = ["ab", "a"]
        
        let result = LongestCommonPrefix().longestCommonPrefix(strs)
        
        XCTAssertEqual(result, "a")
    }
    
    func test_E() {
        let strs = ["cir", "car"]
        
        let result = LongestCommonPrefix().longestCommonPrefix(strs)
        
        XCTAssertEqual(result, "c")
    }
}
