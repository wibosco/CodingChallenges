//
//  ImplementStrStrTests.swift
//  LeetCodeTests
//
//  Created by William Boles on 11/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

final class ImplementStrStrTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let haystack = "hello"
        let needle = "ll"
        
        let result = ImplementStrStr.strStr(haystack, needle)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_B() {
        let haystack = "aaaaa"
        let needle = "bba"
        
        let result = ImplementStrStr.strStr(haystack, needle)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_C() {
        let haystack = ""
        let needle = ""
        
        let result = ImplementStrStr.strStr(haystack, needle)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_D() {
        let haystack = "plllol"
        let needle = "llol"
        
        let result = ImplementStrStr.strStr(haystack, needle)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_E() {
        let haystack = ""
        let needle = "a"
        
        let result = ImplementStrStr.strStr(haystack, needle)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_F() {
        let haystack = "a"
        let needle = ""
        
        let result = ImplementStrStr.strStr(haystack, needle)
        
        XCTAssertEqual(result, 0)
    }
    
    func test_G() {
        let haystack = "aaa"
        let needle = "aaaa"
        
        let result = ImplementStrStr.strStr(haystack, needle)
        
        XCTAssertEqual(result, -1)
    }
    
    func test_H() {
        let haystack = "mississippi"
        let needle = "issipi"
        
        let result = ImplementStrStr.strStr(haystack, needle)
        
        XCTAssertEqual(result, -1)
    }
}
