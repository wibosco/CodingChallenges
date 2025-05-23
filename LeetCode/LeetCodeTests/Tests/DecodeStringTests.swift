//
//  DecodeStringTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 15/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class DecodeStringTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let s = "3[a]2[bc]"
        
        let result = DecodeString().decodeString(s)
        
        XCTAssertEqual(result, "aaabcbc")
    }
    
    func test_B() {
        let s = "3[a2[c]]"
        
        let result = DecodeString().decodeString(s)
        
        XCTAssertEqual(result, "accaccacc")
    }
    
    func test_C() {
        let s = "2[abc]3[cd]ef"
        
        let result = DecodeString().decodeString(s)
        
        XCTAssertEqual(result, "abcabccdcdcdef")
    }
    
    func test_D() {
        let s = "abc3[cd]xyz"
        
        let result = DecodeString().decodeString(s)
        
        XCTAssertEqual(result, "abccdcdcdxyz")
    }
    
    func test_E() {
        let s = "10[leetcode]"
        
        let result = DecodeString().decodeString(s)
        
        XCTAssertEqual(result, "leetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcode")
    }
    
    func test_F() {
        let s = "12[e]"
        
        let result = DecodeString().decodeString(s)
        
        XCTAssertEqual(result, "eeeeeeeeeeee")
    }
}
