//
//  ImplementStrStrTests.swift
//  CodingChallengesTests
//
//  Created by William Boles on 11/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import XCTest

@testable import LeetCode

class ImplementStrStrTests: XCTestCase {

    // MARK: - Tests
    
    func test_A() {
        let haystack = "hello"
        let needle = "ll"
        
        let pos = ImplementStrStr.strStr(haystack, needle)
        
        XCTAssertEqual(pos, 2)
    }
    
    func test_B() {
        let haystack = "aaaaa"
        let needle = "bba"
        
        let pos = ImplementStrStr.strStr(haystack, needle)
        
        XCTAssertEqual(pos, -1)
    }
    
    func test_C() {
        let haystack = ""
        let needle = ""
        
        let pos = ImplementStrStr.strStr(haystack, needle)
        
        XCTAssertEqual(pos, 0)
    }
    
    func test_D() {
        let haystack = "plllol"
        let needle = "llol"
        
        let pos = ImplementStrStr.strStr(haystack, needle)
        
        XCTAssertEqual(pos, 2)
    }
    
    func test_E() {
        let haystack = ""
        let needle = "a"
        
        let pos = ImplementStrStr.strStr(haystack, needle)
        
        XCTAssertEqual(pos, -1)
    }
    
    func test_F() {
        let haystack = "a"
        let needle = ""
        
        let pos = ImplementStrStr.strStr(haystack, needle)
        
        XCTAssertEqual(pos, 0)
    }
    
    func test_G() {
        let haystack = "aaa"
        let needle = "aaaa"
        
        let pos = ImplementStrStr.strStr(haystack, needle)
        
        XCTAssertEqual(pos, -1)
    }
    
    func test_H() {
        let haystack = "mississippi"
        let needle = "issipi"
        
        let pos = ImplementStrStr.strStr(haystack, needle)
        
        XCTAssertEqual(pos, -1)
    }
}
